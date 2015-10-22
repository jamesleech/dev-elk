#default['java']['install_flavor'] = 'oracle'
#default['java']['jdk_version'] = '8'
#default['java']['oracle']['accept_oracle_download_terms'] = true
#java 8 isn't working with vagrant cachier with windows as a host. it's downloaded then extracted to a cached folder on the windows file system which is causing the issue.


default['java']['install_flavor'] = 'openjdk'
default['java']['jdk_version'] = '7'

default['repositories']['elasticsearch']['url'] = 'http://packages.elastic.co/elasticsearch/1.7/debian'
default['repositories']['elasticsearch']['key'] = 'https://packages.elastic.co/GPG-KEY-elasticsearch'
default['repositories']['elasticsearch']['components'] = ['stable', 'main'] 

default['repositories']['logstash']['url'] = 'http://packages.elasticsearch.org/logstash/1.5/debian'
default['repositories']['logstash']['key'] = 'https://packages.elasticsearch.org/GPG-KEY-elasticsearch'
default['repositories']['logstash']['components'] = ['stable', 'main'] 

default['repositories']['curator']['url'] = 'http://packages.elasticsearch.org/curator/3/debian'
default['repositories']['curator']['key'] = 'https://packages.elasticsearch.org/GPG-KEY-elasticsearch'
default['repositories']['curator']['components'] = ['stable', 'main'] 

default['packages'] = [
	'nano', 'unzip',
	'curl',
	'smbclient', 
	'smbfs', 
	'apache2-utils', 
	'elasticsearch', #todo, use the elasticsearch recipe instead of installing package.
	'logstash',
	'python-elasticsearch-curator']


default['kibana']['url'] = 'https://download.elasticsearch.org/kibana/kibana/kibana-4.1.1-linux-x64.tar.gz'
default['kibana']['user']['username'] = 'kibanaadmin'
default['kibana']['user']['password'] = '123' #TODO, data bag.

default['logstash']['conf.d'] = '/etc/logstash/conf.d/'

default['smbfs']['mounts'] = [
	'/mnt/prod/ASLDirA01/', '/mnt/prod/ASLDirA02/', '/mnt/prod/ASLDirA03/',
	'/mnt/prod/ASLDirE01/', '/mnt/prod/ASLDirE02/', '/mnt/prod/ASLDirE03/']
