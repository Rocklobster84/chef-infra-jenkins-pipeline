#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.
apt_update

package node['apache']['package_name'] 

file node['apache']['default_index_html'] do
  content '<h1>Welcome Home!</h1><p>Here\'s a change</p>'
end

service node['apache']['service_name'] do
  action [:enable, :start]
end