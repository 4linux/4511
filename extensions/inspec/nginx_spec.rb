nginx_params = yaml(content: inspec.profile.file('params.yml')).params

required_version = nginx_params['version']
required_modules = nginx_params['modules']

control 'nginx-version' do
  impact 1.0
  title 'NGINX version'
  desc 'The required version of NGINX should be installed.'
  describe nginx do
    its('version') { should cmp >= required_version }
  end
end

control 'nginx-modules' do
  impact 1.0
  title 'NGINX version'
  desc 'The required NGINX modules should be installed.'
  describe nginx do
    required_modules.each do |required_module|
      its('modules') { should include required_module }
    end
  end
end

control 'nginx-conf' do
  impact 1.0
  title 'NGINX configuration'
  desc 'The NGINX config file should owned by root, be writable only by owner, and not writeable or and readable by others.'
  describe file('/etc/nginx/nginx.conf') do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should_not be_readable.by('others') }
    it { should_not be_writable.by('others') }
    it { should_not be_executable.by('others') }
  end
end
