#default['java']['install_flavor'] = 'oracle'
#default['java']['jdk_version'] = '8'
#default['java']['oracle']['accept_oracle_download_terms'] = true

default['java']['install_flavor'] = 'openjdk'
default['java']['jdk_version'] = '7'

default['packages'] = [
	'nano', 
	'curl',
	'smbclient', 
	'smbfs', 
	'apache2-utils', 
	'elasticsearch', #todo, use the elasticsearch recipe instead of installing package.
	'logstash']


default['logstash']['conf.d'] = '/etc/logstash/conf.d/'

#default[''][]'http://packages.elastic.co/elasticsearch/1.7/debian'