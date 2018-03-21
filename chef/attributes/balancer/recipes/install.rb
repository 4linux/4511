package 'nginx' do
  action :install
  notifies :start, 'service[nginx]', :immediately
end
