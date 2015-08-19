#
# Cookbook Name:: dev-elk
# Recipe:: logstash_config.rb
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

#config logstash

#Generate SSL Certificates

directory '/etc/pki/tls/certs' do
  owner 'root'
  group 'root'
  recursive true
  #mode '0755'
  action :create
end

directory '/etc/pki/tls/private' do
  owner 'root'
  group 'root'
  recursive true
  #mode '0755'
  action :create
end

#the logstash forwarder public key.
cookbook_file '/etc/pki/tls/certs/logstash-forwarder.crt' do
	source 'logstash-forwarder.crt'
	action :create
end

#the logstash forwarder private key.
cookbook_file '/etc/pki/tls/private/logstash-forwarder.key' do
	source 'logstash-forwarder.crt'
	action :create
end


#todo, include files based on attributes, git clone, wget....
#see chef resource type deploy 
cookbook_file '/etc/logstash/conf.d/01-lumberjack-input.conf' do
  source '01-lumberjack-input.conf'
  action :create
end

cookbook_file '/etc/logstash/conf.d/10-syslog.conf' do
  source '01-lumberjack-input.conf'
  action :create
end

cookbook_file '/etc/logstash/conf.d/30-lumberjack-output.conf' do
  source '01-lumberjack-input.conf'
  action :create
end

#set service to start on boot and start it now. #sudo update-rc.d logstash defaults 96 9
service 'logstash' do	
  supports :status => true, :restart => true, :reload => true
  action [ :enable ]
end



