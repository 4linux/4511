service 'mariadb' do
  supports status: true, restart: true, reload: true
  action [:enable, :start]
end
