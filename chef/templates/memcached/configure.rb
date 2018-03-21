template 'memcached.conf' do
  only_if { node['platform_family'] == 'debian' }
  path '/etc/memcached.conf'
  source 'memcached-debian.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[memcached]', :immediately
end
template 'memcached' do
  only_if { node['platform_family'] == 'rhel' }
  path '/etc/sysconfig/memcached'
  source 'memcached-redhat.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[memcached]', :immediately
end
