usuarios = data_bag('usuarios')

usuarios.each do |login|
  admin = data_bag_item('usuarios', login)
  home = "/home/#{login}"
  user(login) do
    uid       admin['uid']
    shell     admin['shell']
    comment   admin['comment']
    password  admin['password']
    home      home
    manage_home true
  end
end
