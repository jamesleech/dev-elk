# dev-elk


This is my implementation of an ELK stack that'll sit in a VM on your development machine.

I'm currently running it on top of a Vagrant box running the precise64 base box.

Elasticsearch, Logstash and Curator are installed from packages.
Kibana is installed from a tar.

TODO: 
1. Configure Curator using attributes, as this is for development usage, 2 days of logs should be enough.
2. Step Logstash to use attributes for which files load.

