config_file = "/etc/dhcp/dhclient.conf"
dimus_base_config = data_bag_item("dimus-base", "config")

if File.exist?(config_file) && dimus_base_config["dns_ip"]
  config_content = IO.read config_file

  if config_content =~ /#prepend domain-name-servers.*?;/
    file "#{config_file}.bak" do
      content config_content
    end

    file config_file do
      content config_content.gsub(/#(prepend domain-name-servers).*?;/m,
                                 "\1 #{dimus_base_config["dns_ip"]};\n"\
                                 "prepend domain-name \"mozzherin.org \"")
    end

    #execute  "sudo ifdown --exclude=lo -a && sudo ifup --exclude=lo -a"
  end
end
