#
# Cookbook:: jenkins
# Recipe:: default
#
# Copyright:: 2022, Stephanie Thompson, All Rights Reserved.

apt_update

package 'openjdk-11-jre'

directory '/opt/jenkins' do
  owner 'ubuntu'
  group 'ubuntu'
  recursive true
end

package 'docker.io' do
  action :install
end

group 'docker' do
  members ['ubuntu']
end