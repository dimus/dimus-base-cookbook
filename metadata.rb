name             "dimus-base"
maintainer       "Dimus"
maintainer_email "dmozzherin@gmail.com"
license          "MIT"
description      "Installs/Configures dimus-base"
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))
version          "0.2.4"

depends "chef-client", "~>3.9"
depends "chef_handler", "~>1.1"
depends "apt", "~>2.6"
depends "yum-epel", "~>0.5"
depends "yum", "~>3.4"
depends "dmg", "~>2.2"
depends "build-essential", "~>2.1"
depends "cron", "~>1.6"
depends "git", "~>4.0"
depends "logrotate", "~>1.7"
depends "runit", "~>1.5"
depends "sudo", "~>2.7"
depends "vim", "~>1.1"
depends "windows", "~>1.34"
depends "eol-users", "~>0.1"

%w(debian ubuntu centos).each do |os|
  supports os
end
