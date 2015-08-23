#
# Cookbook Name:: dev-elk
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'apt::default'
include_recipe 'java::default'

#update repos
include_recipe 'dev-elk::add-repos'

#mount shares
include_recipe 'dev-elk::mount_points'
include_recipe 'smbfs::attribute_driven'

#install
include_recipe 'packages::default' #installed elasticsearch and logstash amoung other selected packages.
include_recipe 'dev-elk::kibana4_install'
include_recipe 'nginx::default'

#config
include_recipe 'dev-elk::elasticsearch_config'
include_recipe 'dev-elk::logstash_config'
include_recipe 'dev-elk::kibana4_config'
include_recipe 'dev-elk::nginx_config'
