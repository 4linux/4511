cookbook_file 'memcache.ini' do
  only_if { node['platform_family'] == 'debian' }
  path '/etc/php/7.0/mods-available/memcache.ini'
  source 'php-memcached-debian.ini'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[apache2]', :immediately
end
cookbook_file 'z-memcached.ini' do
  only_if { node['platform_family'] == 'rhel' }
  path '/etc/php.d/z-memcached.ini'
  source 'php-memcached-redhat.ini'
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
cookbook_file 'cache-test.php' do
  only_if { node['platform_family'] == 'debian' }
  path '/var/www/html/cache-test.php'
  source 'cache-test.php'
  owner 'www-data'
  group 'www-data'
  mode '0644'
  notifies :restart, 'service[apache2]', :immediately
end
cookbook_file 'cache-test.php' do
  only_if { node['platform_family'] == 'rhel' }
  path '/var/www/html/cache-test.php'
  source 'cache-test.php'
  owner 'apache'
  group 'apache'
  mode '0644'
  notifies :restart, 'service[httpd]', :immediately
end
file '/var/www/html/index.html' do
  action :delete
end
