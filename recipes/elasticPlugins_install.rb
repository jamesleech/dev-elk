#
# Cookbook Name:: dev-elk
# Recipe:: elasticHQ_install
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

execute 'elasticsearch-HQ-Install' do
	#command '/usr/share/elasticsearch/bin/plugin --remove royrusso/elasticsearch-HQ'
	#rmdir /usr/share/elasticsearch/plugins/HQ
	command '/usr/share/elasticsearch/bin/plugin -install royrusso/elasticsearch-HQ'
	not_if { ::File.exists?('/usr/share/elasticsearch/plugins/HQ') }
end

execute 'elasticsearch-bigdesk' do
	#command '/usr/share/elasticsearch/bin/plugin -remove lukas-vlcek/bigdesk'
	command '/usr/share/elasticsearch/bin/plugin -install lukas-vlcek/bigdesk'
	not_if { ::File.exists?('/usr/share/elasticsearch/plugins/bigdesk') }
end
