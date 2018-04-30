control 'cis-debian-9' do
  impact 0.7
  title 'Ensure default user umask is 027 or more restrictive'
  desc 'The default umask determines the permissions of files created by users.'
  describe file('/etc/bash.bashrc') do
    its('content') { should match /^umask 027/ }
  end
  describe file('/etc/profile') do
    its('content') { should match /^umask 027/ }
  end
end
control 'v-38443-gshadow' do
  impact 0.5
  title 'v-38443: verify gshadow is owned by root'
  describe file('/etc/gshadow') do
    it { should be_owned_by 'root' }
  end
end
