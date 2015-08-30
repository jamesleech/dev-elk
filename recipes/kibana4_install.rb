#
# Cookbook Name:: dev-elk
# Recipe:: kibana4_install.rb
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# Install Kibana4

# wget https://download.elasticsearch.org/kibana/kibana/kibana-4.1.1-linux-x64.tar.gz
remote_file '/tmp/vagrant-cache/chef/kibana4.tar.gz' do
  source node['kibana']['url']
  action :create_if_missing
  not_if { ::File.exists?('/tmp/vagrant-cache/chef/kibana4.tar.gz') }
end

# sudo tar xf kibana-3.1.0.tar.gz -C /srv/www/  
bash 'extract_kibana4' do
  cwd ::File.dirname('/tmp/vagrant-cache/chef/kibana4.tar.gz')
  code <<-EOH
    mkdir -p /tmp/kibana4
    tar xzf /tmp/vagrant-cache/chef/kibana4.tar.gz -C /tmp/kibana4
    sudo mkdir -p /opt/kibana
    sudo mv /tmp/kibana4/*/* /opt/kibana/
    EOH
  not_if { ::File.exists?('/opt/kibana') }
end

