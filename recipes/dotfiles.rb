require "ostruct"

def add_dotfiles_dir(user)
  make_src_dir(user)
  sync_dotfile_git(user)
end

def make_src_dir(user)
  src = File.join(user.home, "src")
  directory src do
    owner user.id
    group user.id
    action :create
  end
  user.dotfiles_dir = File.join(src, "dotfiles")
end

def sync_dotfile_git(user)
  git user.dotfiles_dir do
    repository node["dimus-base"]["dotfile-git"]
    user user.id
    group user.id
    action :sync
  end
end

def make_symlinks(user)
  paths = [user.dotfiles_dir]
  if node["platform"] =~ /darwin/
    paths << File.join(user.dotfiles_dir, "mac")
  else
    paths << File.join(user.dotfiles_dir, "unix")
  end
  paths.each do |path|
    process_links(path, user)
  end
end

def process_links(path, user)
  return unless File.exist?(path)
  Dir.entries(path).each do |file|
    file_path = File.join(path, file)
    home_path = File.join(user.home, file)
    if dotfile?(file) && !link?(home_path, file_path)
      make_link(home_path, file_path, user)
    end
  end
end

def make_link(home_path, file_path, u)
  if File.file?(home_path)
    link_file(home_path, file_path, u)
  else
    link_dir(home_path, file_path, u)
  end
end

def link_file(home_path, file_path, u)
  file home_path do
    action :delete
    recursive :true
  end
  link file_path do
    owner u.id
    group u.id
    to home_path
  end
end

def link_dir(home_path, file_path, u)
  directory home_path do
    action :delete
  end
  execute "ln -s #{file_path} #{home_path}" do
    user u.id
    cwd u.home
  end
end

def dotfile?(file)
  file[0] == "." && !%w(. .. .git .gitignore .gitconfig).include?(file)
end

def link?(home_path, file_path)
  File.symlink?(home_path) && File.readlink(home_path) == file_path
end

def dotfiles
  home_prefix = node["platform"] =~ /darwin/ ? "/Users/" : "/home/"

  search("users", "groups:dotfiles").each do |user|
    u = OpenStruct.new(
      id: user["id"],
      home: home_prefix + user["id"]
    )
    add_dotfiles_dir(u)
    make_symlinks(u)
  end
end

if Chef::Config[:solo]
  Chef::Log.warn("This recipe uses search. Chef Solo does not support search")
else
  dotfiles
end
