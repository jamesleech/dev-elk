#
# Cookbook Name:: dev-elk
# Recipe:: nginx_config
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


#create kibana users file


#the logstash forwarder public key.
cookbook_file '/etc/nginx/htpasswd.users' do
	source 'htpassd.users'
	action :create
end

cookbook_file '/etc/nginx/sites-available/default' do
	source 'nginx-default'
	action :create
	#notifies :restart, 'service[elasticsearch]', :delayed
	notifies :restart, 'service[nginx]', :delayed	
	#notifies :restart, 'service[logstash]', :delayed
	notifies :restart, 'service[kibana4]', :delayed
end