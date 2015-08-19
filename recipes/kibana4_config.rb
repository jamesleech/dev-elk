#
# Cookbook Name:: dev-elk
# Recipe:: kibana4_config
#
# Copyright (c) 2015 The Authors, All Rights Reserved.



# $sudo chmod +x /etc/init.d/kibana4
cookbook_file '/etc/init.d/kibana4' do
	source 'kibana4-service.sh'
	mode '0777'
	action :create
end

# $sudo update-rc.d kibana4 defaults 96 9 
# $sudo service kibana4 start

service 'kibana4' do	
  supports :status => true, :restart => true, :reload => true
  action [ :enable ]
end
