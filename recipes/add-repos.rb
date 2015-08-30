
apt_repository 'elasticsearch' do
  uri        	node['repositories']['elasticsearch']['url']
  key 			node['repositories']['elasticsearch']['key'] 
  components 	node['repositories']['elasticsearch']['components']
end

apt_repository 'logstash' do
  uri        	node['repositories']['logstash']['url']
  key 			node['repositories']['logstash']['key'] 
  components 	node['repositories']['logstash']['components']
end

apt_repository 'curator' do
  uri        	node['repositories']['curator']['url']
  key 			node['repositories']['curator']['key'] 
  components 	node['repositories']['curator']['components']
end
