#
# Cookbook Name:: dev-elk
# Recipe:: logstash_config.rb
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

#delete all existing conf.
remote_file '/etc/logstash/conf.d/*' do
  action :delete
end

#todo, include files based on attributes, git clone, wget....
#see chef resource type deploy 
# cookbook_file '/etc/logstash/conf.d/01-LSqlRF.logstash.conf' do
#   source 'LSqlRF.logstash.conf'
#   action :create
# end

cookbook_file '/etc/logstash/conf.d/10000-cvslog.input.logstash.conf' do
  source 'csvlog.input.logstash.conf'
  action :create
end

cookbook_file '/etc/logstash/conf.d/50000-cvslog.filter.logstash.conf' do
  source 'csvlog.filter.logstash.conf'
  action :create
end

cookbook_file '/etc/logstash/conf.d/99999-Elasticsearch.logstash.conf' do
  source 'elasticsearch.output.logstash.conf'
  action :create
end

#set service to start on boot and start it now. #sudo update-rc.d logstash defaults 96 9
service 'logstash' do	
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end



