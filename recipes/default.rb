include_recipe "apt"
include_recipe "yum"
include_recipe "chef-client"
#include_recipe "chef-client::delete_validation"
include_recipe "git"
include_recipe "vim"
include_recipe "users"

