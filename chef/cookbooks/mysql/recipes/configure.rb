cookbook_file '.my.cnf' do
  path '/root/.my.cnf'
  source 'root_pass.cnf'
  owner 'root'
  group 'root'
  mode '0644'
end
cookbook_file '50-server.cnf' do
  only_if { node['platform_family'] == 'debian' }
  path '/etc/mysql/mariadb.conf.d/50-server.cnf'
  source 'mysql-debian.cnf'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[mariadb]', :immediately
end
cookbook_file 'server.cnf' do
  only_if { node['platform_family'] == 'rhel' }
  path '/etc/my.cnf.d/server.cnf'
  source 'mysql-redhat.cnf'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[mariadb]', :immediately
end
cookbook_file 'mysql_secure_installation.sql' do
  path '/tmp/mysql_secure_installation.sql'
  source 'mysql_secure_installation.sql'
  owner 'root'
  group 'root'
  mode '0644'
end
cookbook_file 'dump.sql' do
  path '/tmp/dump.sql'
  source 'dump.sql'
  owner 'root'
  group 'root'
  mode '0644'
end
