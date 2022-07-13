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

file '/etc/nginx/nginx.conf' do
  mode '0700'
end