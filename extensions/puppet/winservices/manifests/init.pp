##### Modulo para gerenciar servicos no Windows
class winservices {
service {'W32Time':
  ensure => running,
  enable => true,
}
}
