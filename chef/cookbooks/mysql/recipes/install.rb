package 'mariadb-server' do
  action :install
  notifies :start, 'service[mariadb]', :immediately
end
