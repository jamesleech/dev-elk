#default['java']['install_flavor'] = 'oracle'
#default['java']['jdk_version'] = '8'
#default['java']['oracle']['accept_oracle_download_terms'] = true

default['java']['install_flavor'] = 'openjdk'
default['java']['jdk_version'] = '7'

node.default['packages'] = ['curl', 'apache2-utils', 'elasticsearch', 'logstash']