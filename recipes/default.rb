#
# Cookbook Name:: jboss
# Recipe:: default
# Author:: Bryan W. Berry (<bryan.berry@gmail.com>)
# Copyright 2011, UN Food and Agriculture Organization
#
# license Apache v2.0
#

jboss_home = node['jboss']['home']
jboss_user = node['jboss']['user']
jboss_group = node['jboss']['group']

jboss_home_parent = Pathname.new(jboss_home).parent().to_s

# get files
ark 'jboss' do
  url node['jboss']['url']
  checksum node['jboss']['checksum']
  extension 'zip'
  path jboss_home_parent
  owner node['jboss']['user']
  action :put
  not_if {File.exists?(jboss_home)}
end

# set perms on directory
directory jboss_home do
  group jboss_group
  owner jboss_user
  mode "0755"
end

execute "chown" do
  creates "#{jboss_home}/.installed"
  command "chown -R #{jboss_user}:#{jboss_group} #{jboss_home} && touch #{jboss_home}/.installed"
  action :run
end

# template init file
if node['jboss']['setup_init_scripts']
  template "/etc/init.d/jboss" do
    if platform? ["centos", "redhat", "suse"] 
      source "init_standalone_el.erb"
    else
      source "init_deb.erb"
    end
    mode "0755"
    owner "root"
    group "root"
  end

  # template jboss-log4j.xml

  # start service
  service jboss_user do
    action [ :enable, :start ]
  end
end
