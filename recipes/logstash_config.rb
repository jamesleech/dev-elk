#
# Cookbook Name:: dev-elk
# Recipe:: logstash_config.rb
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

#config logstash

#Generate SSL Certificates
# sudo mkdir -p /etc/pki/tls/certs
# sudo mkdir /etc/pki/tls/private


#/etc/logstash/conf.d/01-lumberjack-input.conf

# input {
#   lumberjack {
#     port => 5000
#     type => "logs"
#     ssl_certificate => "/etc/pki/tls/certs/logstash-forwarder.crt"
#     ssl_key => "/etc/pki/tls/private/logstash-forwarder.key"
#   }
# }

#/etc/logstash/conf.d/10-syslog.conf

# filter {
#   if [type] == "syslog" {
#     grok {
#       match => { "message" => "%{SYSLOGTIMESTAMP:syslog_timestamp} %{SYSLOGHOST:syslog_hostname} %{DATA:syslog_program}(?:\[%{POSINT:syslog_pid}\])?: %{GREEDYDATA:syslog_message}" }
#       add_field => [ "received_at", "%{@timestamp}" ]
#       add_field => [ "received_from", "%{host}" ]
#     }
#     syslog_pri { }
#     date {
#       match => [ "syslog_timestamp", "MMM  d HH:mm:ss", "MMM dd HH:mm:ss" ]
#     }
#   }
# }

# /etc/logstash/conf.d/30-lumberjack-output.conf

# output {
#   elasticsearch { host => localhost }
#   stdout { codec => rubydebug }
# }

#set service to start on boot and start it now. #sudo update-rc.d logstash defaults 96 9

service 'logstash' do	
  supports :restart => true, :reload => true
  action [ :enable, :start ]
end


