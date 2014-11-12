include_recipe "apt"
include_recipe "yum"
# include_recipe "chef-client"
include_recipe 'chef-client::config'
include_recipe 'chef-client::service'
include_recipe "chef-client::delete_validation"
include_recipe "git"
include_recipe "vim"
include_recipe "users"
include_recipe "users::sysadmins"
include_recipe "sudo"
include_recipe "dimus-base::dotfiles"
