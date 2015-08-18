#update apt Public Signing Key 
#wget -qO - https://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add -

#Add the repository definition 
#echo "deb http://packages.elasticsearch.org/logstash/1.5/debian stable main" | sudo tee -a /etc/apt/sources.list

apt_repository 'elasticsearch' do
  uri        	'http://packages.elastic.co/elasticsearch/1.7/debian'
  key 			'https://packages.elastic.co/GPG-KEY-elasticsearch'
  components ['stable', 'main']
end

apt_repository 'logstash' do
  uri        	'http://packages.elasticsearch.org/logstash/1.5/debian'
  key 			'https://packages.elasticsearch.org/GPG-KEY-elasticsearch'
  components ['stable', 'main']
end
