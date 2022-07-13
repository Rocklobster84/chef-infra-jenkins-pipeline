#
# Cookbook:: nginx
# Recipe:: default
#
# Copyright:: 2022, Stephanie Thompson, All Rights Reserved.

package 'nginx' do
  action :install
end

service 'nginx' do
  action [ :enable, :start ]
end

template '/etc/nginx/nginx.conf' do
  source 'nginx.conf.erb'
  notifies :reload, 'service[nginx]'
end
