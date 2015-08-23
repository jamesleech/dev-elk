#
# Cookbook Name:: dev-elk
# Recipe:: mount_points
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

node['smbfs']['mounts'].each_pair do |path, config|
	directory path do
	  recursive true
	  action :create
	end
end