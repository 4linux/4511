##### Classe para gerenciar configuracao do MySQL

class mysqlserver::configure {

$conf_name = $facts['os']['family'] ? {
    'Debian' => 'mysql-debian.cnf.erb',
    'RedHat' => 'mysql-redhat.cnf.erb',
}
$path_file = $facts['os']['family'] ? {
    'Debian' => '/etc/mysql/mariadb.conf.d/50-server.cnf',
    'RedHat' => '/etc/my.cnf.d/server.cnf',
}
file { $conf_name:
  ensure  => present,
  path    => $path_file,
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  content => template("mysqlserver/${conf_name}"),
  notify  => Service['mariadb']
}
file { '.my.cnf':
  ensure => present,
  path   => '/root/.my.cnf',
  owner  => 'root',
  group  => 'root',
  mode   => '0644',
  source => 'puppet:///modules/mysqlserver/root_pass.cnf',
}
}
