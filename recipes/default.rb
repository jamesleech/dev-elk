#
# Cookbook Name:: dev-elk
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'apt::default'
include_recipe 'java::default'

#update repos
include_recipe 'dev-elk::add-repos'

include_recipe 'packages::default'

#elasticsearch
include_recipe 'dev-elk::elasticsearch_config'

#logstash
#include_recipe 'dev-elk::logstash_config'

#kibana4
#include_recipe 'dev-elk::kibana4_install'
#include_recipe 'dev-elk::kibana4_config'