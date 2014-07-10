#
# Cookbook Name:: aar
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "apache2"

service "apache2" do
  action [ :enable, :start ]
end

aardir = Chef::Config[:file_cache_path] 
aarfile = "#{aardir}/master.zip"
aarapp = "Awesome-Appliance-Repair-master"

remote_file aarfile do
  source "https://github.com/colincam/Awesome-Appliance-Repair/archive/master.zip"
  mode "0644"
end

execute "unzip -o #{aarfile}" do
  not_if do
    File.directory?(aarapp)
  end
end

execute "mv #{aarapp}/AAR /var/www" do
  not_if do
    File.directory?("/var/www/AAR")
  end
end

cookbook_file "#{aarapp}/AARinstall.py" do
  action :delete
end

template "#{aarapp}/AARinstall.py" do
  source "AARinstall.py.erb"
  mode "0755"
  variables(
    :mysql_passwd => node['mysql']['server_root_password']
  )
end

execute "python /#{aarapp}/AARinstall.py" do
  cwd aarapp
  user "root"
  notifies :restart, "service[apache2]"
end

