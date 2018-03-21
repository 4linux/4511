template 'memcache.ini' do
  only_if { node['platform_family'] == 'debian' }
  path '/etc/php/7.0/mods-available/memcache.ini'
  source 'php-memcached-debian.ini.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[apache2]', :immediately
end
template 'z-memcached.ini' do
  only_if { node['platform_family'] == 'rhel' }
  path '/etc/php.d/z-memcached.ini'
  source 'php-memcached-redhat.ini.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[httpd]', :immediately
end
remote_directory '/var/www/html' do
  only_if { node['platform_family'] == 'debian' }
  source 'lamp'
  owner 'www-data'
  group 'www-data'
  mode '0755'
  action :create
end
remote_directory '/var/www/html' do
  only_if { node['platform_family'] == 'rhel' }
  source 'lamp'
  owner 'apache'
  group 'apache'
  mode '0755'
  action :create
end
template 'banco.php' do
  only_if { node['platform_family'] == 'debian' }
  path '/var/www/html/include/banco.php'
  source 'banco.php.erb'
  owner 'www-data'
  group 'www-data'
  mode '0644'
  variables(database: node['banco']['config'])
  notifies :restart, 'service[apache2]', :immediately
end
template 'banco.php' do
  only_if { node['platform_family'] == 'rhel' }
  path '/var/www/html/include/banco.php'
  source 'banco.php.erb'
  owner 'apache'
  group 'apache'
  mode '0644'
  variables(database: node['banco']['config'])
  notifies :restart, 'service[apache2]', :immediately
end
template 'cache-test.php' do
  only_if { node['platform_family'] == 'debian' }
  path '/var/www/html/cache-test.php'
  source 'cache-test.php.erb'
  owner 'www-data'
  group 'www-data'
  mode '0644'
  variables(memcached: node['php']['config'])
  notifies :restart, 'service[apache2]', :immediately
end
template 'cache-test.php' do
  only_if { node['platform_family'] == 'rhel' }
  path '/var/www/html/cache-test.php'
  source 'cache-test.php.erb'
  owner 'apache'
  group 'apache'
  mode '0644'
  variables(memcached: node['php']['config'])
  notifies :restart, 'service[httpd]', :immediately
end
file '/var/www/html/index.html' do
  action :delete
end
