package 'memcached' do
  action :install
  notifies :start, 'service[memcached]', :immediately
end
