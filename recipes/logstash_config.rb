#
# Cookbook Name:: dev-elk
# Recipe:: logstash_config.rb
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

#config logstash

#Generate SSL Certificates
# sudo mkdir -p /etc/pki/tls/certs
# sudo mkdir /etc/pki/tls/private
#generate /etc/pki/tls/private/logstash-forwarder.keylogstash-forwarder.key

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
  action [ :enable, :start ]
end



