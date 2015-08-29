#
# Cookbook Name:: dev-elk
# Recipe:: logstash_config.rb
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

#delete all existing conf.
Dir[node['logstash']['conf.d'] + '*'].each do |path|
  file ::File.expand_path(path) do
    action :delete
  end
end

cookbook_file node['logstash']['conf.d'] + '10000-input.csv.logstash.conf' do
  source 'input.csv.logstash.conf'
  action :create
end

cookbook_file node['logstash']['conf.d'] + '20000-input.fixed.logstash.conf' do
  source 'input.fixed.logstash.conf'
  action :create
end

cookbook_file node['logstash']['conf.d'] + '50000-filter.log.logstash.conf' do
  source 'filter.log.logstash.conf'
  action :create
end

cookbook_file node['logstash']['conf.d'] + '50001-filter.logmessage.logstash.conf' do
  source 'filter.logmessage.logstash.conf'
  action :create
end

cookbook_file node['logstash']['conf.d'] + '50002-filter.webmessage.logstash.conf' do
  source 'filter.webmessage.logstash.conf'
  action :create
end

cookbook_file node['logstash']['conf.d'] + '80000-output.elasticsearch.logstash.conf' do
  source 'output.elasticsearch.logstash.conf'
  action :create
end

cookbook_file node['logstash']['conf.d'] + '90000-output.webmessage.logstash.conf' do
  source 'output.webmessage.logstash.conf'
  action :create
end

#set service to start on boot and start it now. #sudo update-rc.d logstash defaults 96 9
service 'logstash' do	
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end



