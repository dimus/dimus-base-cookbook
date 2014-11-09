name             "dimus-base"
maintainer       "Dimus"
maintainer_email "dmozzherin@gmail.com"
license          "MIT"
description      "Installs/Configures dimus-base"
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))
version          "0.1.10"

%w(apt yum chef-client git vim users sudo).each do |cb|
  depends cb
end

%w(debian ubuntu centos).each do |os|
  supports os
end
