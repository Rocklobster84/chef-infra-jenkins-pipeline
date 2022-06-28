#
# Cookbook:: jenkins
# Recipe:: default
#
# Copyright:: 2022, Stephanie Thompson, All Rights Reserved.

apt_update 

package 'openjdk-8-jdk'

remote_file 'jenkins.war' do
    source 'https://get.jenkins.io/war-stable/2.249.2/jenkins.war'
end

execute 'nohup java -jar jenkins.war &'

execute 'show initial password' do
    command 'sudo cat /root/.jenkin/secrets/initialAdminPassword'
    live_stream true
    action :run 
end
