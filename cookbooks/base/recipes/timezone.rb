
file "/etc/timezone" do
  content node[:timezone]
end

#case node["platform_family"]
#when "debian"

execute "update timezone" do
  command "dpkg-reconfigure -f noninteractive tzdata"
end

#when "suse"
#end

