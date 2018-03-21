##### Classe para gerenciar o servico do MySQL

class mysqlserver::service {

$conf_name = $facts['os']['family'] ? {
    'Debian' => 'mysql-debian.cnf.erb',
    'RedHat' => 'mysql-redhat.cnf.erb',
}

service { 'mariadb':
  ensure     => running,
  enable     => true,
  hasrestart => true,
  hasstatus  => true,
  require    => Package['mariadb-server'],
  subscribe  => File[$conf_name]
}
}
