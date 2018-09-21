# # encoding: utf-8

# Inspec test for recipe datadog::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  describe group('dd-agent') do
    it { should exist }
  end

  describe user('dd-agent')  do
    it { should exist }
  end
end

describe file('/etc/datadog-agent/conf.d/zfs_available_check.yaml') do
  its('mode') { should cmp '0644' }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
end

describe file('/etc/datadog-agent/checks.d/zfs_available_check.py') do
  its('mode') { should cmp '0644' }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
end

describe service('datadog-agent') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end
