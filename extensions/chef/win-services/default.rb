windows_service 'W32Time' do
  action :start
  startup_type :automatic
end
