##### Classe para gerenciar banco e tabelas no MySQL

class mysqlserver::database {

file { 'mysql_secure_installation.sql':
  ensure => present,
  path   => '/tmp/mysql_secure_installation.sql',
  owner  => 'root',
  group  => 'root',
  mode   => '0644',
  source => 'puppet:///modules/mysqlserver/mysql_secure_installation.sql',
}
file { 'dump.sql':
  ensure => present,
  path   => '/tmp/dump.sql',
  owner  => 'root',
  group  => 'root',
  mode   => '0644',
  source => 'puppet:///modules/mysqlserver/dump.sql',
}
exec { 'mysql_secure_installation':
  path    => '/usr/bin:/usr/sbin:/bin',
  command => 'mysql -sfu root < /tmp/mysql_secure_installation.sql',
  unless  => 'mysql -u root -p4linux',
  require => File['mysql_secure_installation.sql'],
}
exec { 'mysql_database_remove':
  path    => '/usr/bin:/usr/sbin:/bin',
  command => 'mysql -u root -p4linux -e "DROP DATABASE IF EXISTS dexter500"',
  require => Package['mariadb-server'],
}
exec { 'mysql_database_create':
  path    => '/usr/bin:/usr/sbin:/bin',
  command => 'mysql -u root -p4linux -e "CREATE DATABASE dexter500;"',
  unless  => 'mysql -u root -p4linux -e "SHOW DATABASES;" | grep dexter500"',
  require => Package['mariadb-server'],
}
exec { 'mysql_import_tables':
  path    => '/usr/bin:/usr/sbin:/bin',
  command => 'mysql -u root -p4linux dexter500 < /tmp/dump.sql',
  unless  => 'mysql -u root -p4linux -e "SELECT * FROM funcionarios;"',
  require => File['dump.sql'],
}
}
