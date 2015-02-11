include_recipe "apt"
include_recipe "yum"
include_recipe "chef-client::config"
include_recipe "chef-client::service"
include_recipe "chef-client::delete_validation" unless Chef::Config["solo"]
include_recipe "git"
include_recipe "vim"
include_recipe "eol-users-wrapper"
include_recipe "sudo"
include_recipe "dimus-base::dotfiles"
include_recipe "dimus-base::dhcp_dns"
