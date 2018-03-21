template 'nginx.conf' do
  only_if { node['platform_family'] == 'debian' }
  path '/etc/nginx/nginx.conf'
  source 'nginx-debian.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(memcached: node['php']['config'],
            webserver01: node['webserver01']['config'],
            webserver02: node['webserver02']['config'])
  notifies :restart, 'service[nginx]', :immediately
end
template 'nginx' do
  only_if { node['platform_family'] == 'rhel' }
  path '/etc/nginx/nginx.conf'
  source 'nginx-redhat.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(memcached: node['php']['config'],
            webserver01: node['webserver01']['config'],
            webserver02: node['webserver02']['config'])
  notifies :restart, 'service[nginx]', :immediately
end
