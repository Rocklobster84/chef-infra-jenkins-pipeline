#
# Cookbook:: jenkins
# Recipe:: default
#
# Copyright:: 2022, Stephanie Thompson, All Rights Reserved.

apt_update

package 'openjdk-11-jre'

apt_repository 'jenkins' do
  uri 'http://pkg.jenkins.io/debian-stable'
  key 'https://pkg.jenkins.io/debian-stable/jenkins.io.key'
  distribution ['binary/']
  action :add
end

apt_package 'jenkins' do
  action :install
end

service 'jenkins' do
  action [:start, :enable]
end

#sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'