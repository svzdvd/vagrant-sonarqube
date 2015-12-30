#
# Cookbook Name:: sonar
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'apt' if platform?('ubuntu')

include_recipe 'java'

mysql_service 'sonar' do
  version '5.6'
  initial_root_password 'root'
  action [:create, :start]
end

mysql2_chef_gem 'default' do
  action :install
end

mysql_connection_info = {:host => "127.0.0.1",
                         :username => 'root',
                         :password => 'root'}

mysql_database 'sonar' do
  connection mysql_connection_info
  action :create
end

mysql_database_user 'sonar' do
  connection mysql_connection_info
  password 'sonar'
  host '%'
  database_name 'sonar'
  action :grant
end

include_recipe 'sonarqube'



