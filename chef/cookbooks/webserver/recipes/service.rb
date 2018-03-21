service 'apache2' do
  only_if { node['platform_family'] == 'debian' }
  supports status: true, restart: true, reload: true
  action [:enable, :start]
end
service 'httpd' do
  only_if { node['platform_family'] == 'rhel' }
  supports status: true, restart: true, reload: true
  action [:enable, :start]
end
