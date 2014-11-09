def make_dotfiles_dir(home)
  src = home + "/src"
  directory src do
    action :create
  end
end

users = []

home_prefix = "/home/"

if node["platform"] =~ /darwin/
  home_prefix = "/Users/"
end

search(:users, "group:dotfiles").each do |user|
  id = user["id"]
  home = home_prefix + id
  make_dotfiles_dir(home)
end
