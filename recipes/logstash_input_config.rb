#
# Cookbook Name:: dev-elk
# Recipe:: logstash_input_config.rb
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

node['smbfs']['mounts'].each_pair do |path, config|

# create mount point directory
	directory path do
	  recursive true
	  action :create
	end

# mount path

# setup logstash input config.

end