#
# Cookbook:: jenkins
# Recipe:: default
#
# Copyright:: 2022, Stephanie Thompson, All Rights Reserved.

apt_update

package 'openjdk-11-jre'

apt_repository "jenkins" do
  uri "http://pkg.jenkins-ci.org/debian-stable"
  key "https://pkg.jenkins.io/debian-stable/jenkins.io.key"
  components ["binary/"]
  action :add
end

package "jenkins"

service "jenkins" do
  supports [:stop, :start, :restart]
  action [:start, :enable]
end