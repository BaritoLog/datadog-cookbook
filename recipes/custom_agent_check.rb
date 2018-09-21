#
# Cookbook:: datadog-cookbook
# Recipe:: custom_agent_check
#
# Copyright:: 2018, BaritoLog.
#
#

template "/etc/datadog-agent/conf.d/zfs_available_check.yaml" do
  source "datadog.zfs_available_check.yaml.erb"
  owner node[cookbook_name]['user']
  group node[cookbook_name]['user']
  mode '0644'
  variables instances: node[cookbook_name]['zfs_available_check']['instances']
  notifies :restart, 'service[datadog-agent]', :delayed
end

template "/etc/datadog-agent/checks.d/zfs_available_check.py" do
  source "datadog.zfs_available_check.py.erb"
  owner node[cookbook_name]['user']
  group node[cookbook_name]['user']
  mode '0644'
  variables instances: node[cookbook_name]['zfs_available_check']['instances']
  notifies :restart, 'service[datadog-agent]', :delayed
end

template "/etc/datadog-agent/conf.d/zfs_used_check.yaml" do
  source "datadog.zfs_used_check.yaml.erb"
  owner node[cookbook_name]['user']
  group node[cookbook_name]['user']
  mode '0644'
  variables instances: node[cookbook_name]['zfs_used_check']['instances']
  notifies :restart, 'service[datadog-agent]', :delayed
end

template "/etc/datadog-agent/checks.d/zfs_used_check.py" do
  source "datadog.zfs_used_check.py.erb"
  owner node[cookbook_name]['user']
  group node[cookbook_name]['user']
  mode '0644'
  variables instances: node[cookbook_name]['zfs_used_check']['instances']
  notifies :restart, 'service[datadog-agent]', :delayed
end