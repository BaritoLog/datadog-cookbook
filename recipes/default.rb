#
# Cookbook:: datadog-cookbook
# Recipe:: default
#
# Copyright:: 2018, BaritoLog, All Rights Reserved.

api_key = node[cookbook_name]['datadog_api_key']
hostname = node[cookbook_name]['datadog_hostname']
user = node[cookbook_name]['user']
group = node[cookbook_name]['group']
datadog_config_path = node[cookbook_name]['datadog_config_path']

execute 'Install Datadog agent' do
  command "DD_API_KEY=#{api_key} DD_INSTALL_ONLY=true bash -c \"$(curl -L https://raw.githubusercontent.com/DataDog/datadog-agent/master/cmd/agent/install_script.sh)\""
  user user
  group group
end

template "#{datadog_config_path}/datadog.yaml" do
  source 'datadog.yaml.erb'
  owner 'dd-agent'
  group 'dd-agent'
  mode '0640'
  variables api_key: api_key, hostname: hostname
end

service 'datadog-agent' do
  supports start: true, enable: true, restart: true
  action [ :enable, :start ]
end
