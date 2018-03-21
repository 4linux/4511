cookbook_file 'memcached.conf' do
  only_if { node['platform_family'] == 'debian' }
  path '/etc/memcached.conf'
  source 'memcached-debian.conf'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[memcached]', :immediately
end
cookbook_file 'memcached' do
  only_if { node['platform_family'] == 'rhel' }
  path '/etc/sysconfig/memcached'
  source 'memcached-redhat.conf'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[memcached]', :immediately
end
