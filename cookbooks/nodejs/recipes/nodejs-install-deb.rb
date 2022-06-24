#
# Cookbook:: nodejs
# Recipe:: default
#
# Copyright:: 2022, Stephanie Thompson, All Rights Reserved.

# Nodejs Installation instructions using package managers: https://nodejs.org/en/download/package-manager/
# Nodesource distros: https://github.com/nodesource/distributions

# Install nodejs on various OS'ss's's
case node['platform']
when 'centos', 'redhat'
  yum_repository 'node.js' do
    baseurl node['nodejs']['repo']
    gpgkey node['nodejs']['key']
  end
when 'debian', 'ubuntu'
  apt_repository 'nodejs' do
    uri node['nodejs']['repo']
  end
end