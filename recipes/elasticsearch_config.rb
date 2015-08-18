#
# Cookbook Name:: dev-elk
# Recipe:: elasticsearch_config.rb
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

#config elasticsearch


#set service to start on boot and start it now. #sudo update-rc.d elasticsearch defaults 95 10

service 'elasticsearch' do	
  supports :restart => true, :reload => true
  action [ :enable, :start ]
end


