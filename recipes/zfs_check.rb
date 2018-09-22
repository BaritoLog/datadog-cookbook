#
# Cookbook:: datadog-cookbook
# Recipe:: zfs_check
#
# Copyright:: 2018, BaritoLog.
#
#

file "/etc/datadog-agent/checks.d/zfs_free_check.py" do
  source "datadog.zfs_free_check.py"
  owner node[cookbook_name]['user']
  group node[cookbook_name]['group']
  mode '0644'
  notifies :restart, 'service[datadog-agent]', :delayed
end

template "/etc/datadog-agent/conf.d/zfs_free_check.yaml" do
  source "datadog.zfs_free_check.yaml.erb"
  owner node[cookbook_name]['user']
  group node[cookbook_name]['group']
  mode '0644'
  variables instances: node[cookbook_name]['zfs_free_check']['instances']
  notifies :restart, 'service[datadog-agent]', :delayed
end

file "/etc/datadog-agent/checks.d/zfs_used_check.py" do
  source "datadog.zfs_used_check.py"
  owner node[cookbook_name]['user']
  group node[cookbook_name]['group']
  mode '0644'
  notifies :restart, 'service[datadog-agent]', :delayed
end

template "/etc/datadog-agent/conf.d/zfs_used_check.yaml" do
  source "datadog.zfs_used_check.yaml.erb"
  owner node[cookbook_name]['user']
  group node[cookbook_name]['group']
  mode '0644'
  variables instances: node[cookbook_name]['zfs_used_check']['instances']
  notifies :restart, 'service[datadog-agent]', :delayed
end
