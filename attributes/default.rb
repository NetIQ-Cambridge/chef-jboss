#
# Cookbook Name:: jboss
# Attributes:: default
# Author:: Bryan W. Berry (<bryan.berry@gmail.com>)
# Copyright 2011, UN Food and Agriculture Organization
#
# license Apache v2.0
#


default['jboss']['home'] = "/usr/local/jboss"
default['jboss']['url'] = "http://sourceforge.net/projects/jboss/files/JBoss/JBoss-5.0.1.GA/jboss-5.0.1.GA.zip/download" 
default['jboss']['checksum'] = "d3274c0c5db33d98a0cdb703d829b833a8c3250e009e5d1843956dd22d182dd8"
default['jboss']['user'] = "jboss"
default['jboss']['group'] = "jboss"
default['jboss']['application'] = 'jboss'
default['jboss']['config'] = 'standalone'
default['jboss']['script'] = 'standalone.sh'
default['jboss']['manage_config_file'] = true
default['jboss']['setup_init_scripts'] = true

default['jboss']['jdbc']['user'] = 'sa'
default['jboss']['jdbc']['passwd'] = ''
default['jboss']['jdbc']['schema'] = ''
default['jboss']['jdbc']['host'] = 'localhost'
default['jboss']['jdbc']['transaction_isolation'] = nil
default['jboss']['jdbc']['driver']['name'] = 'h2'
default['jboss']['jdbc']['driver']['module'] = 'com.h2database.h2'
default['jboss']['jdbc']['driver']['version'] = ''
default['jboss']['jdbc']['driver']['class'] = 'org.h2.jdbcx.JdbcDataSource'
default['jboss']['datasources'] = []
default['jboss']['queues'] = []
default['jboss']['drivers'] = []
default['jboss']['extra_modules'] = []
default['jboss']['jms_queues'] = []
