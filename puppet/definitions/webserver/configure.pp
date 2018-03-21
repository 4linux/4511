##### Classe para gerenciar configuracao do Apache com suporte a PHP
define webserver::configure(
  String $cache,
  String $banco,
) {

$conf_name = $facts['os']['family'] ? {
    'Debian' => 'php-memcached-debian.ini.erb',
    'RedHat' => 'php-memcached-redhat.ini.erb',
}
$path_file = $facts['os']['family'] ? {
    'Debian' => '/etc/php/7.0/mods-available/memcache.ini',
    'RedHat' => '/etc/php.d/z-memcached.ini',
}
$perm_user = $facts['os']['family'] ? {
    'Debian' => 'www-data',
    'RedHat' => 'apache',
}
$service_name = $facts['os']['family'] ? {
    'Debian' => 'apache2',
    'RedHat' => 'httpd',
}
file { $conf_name:
  ensure  => present,
  path    => $path_file,
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  content => template("webserver/${conf_name}"),
  notify  => Service[$service_name]
}
file { 'lamp.tar.gz':
  ensure => present,
  path   => '/tmp/lamp.tar.gz',
  owner  => 'root',
  group  => 'root',
  mode   => '0644',
  source => 'puppet:///modules/webserver/lamp.tar.gz',
}
exec { 'tar zxvf /tmp/lamp.tar.gz -C /var/www/html':
  path    => '/usr/bin:/usr/sbin:/bin',
  unless  => 'ls /var/www/html/include/banco.php',
  require => File['lamp.tar.gz'],
}
file { '/var/www/html':
  ensure  => 'directory',
  path    => '/var/www/html',
  owner   => $perm_user,
  group   => $perm_user,
  recurse => true,
}
file { 'cache-test.php':
  ensure  => present,
  path    => '/var/www/html/cache-test.php',
  owner   => $perm_user,
  group   => $perm_user,
  mode    => '0644',
  content => template('webserver/cache-test.php.erb'),
}
file { 'banco.php':
  ensure  => present,
  path    => '/var/www/html/include/banco.php',
  owner   => $perm_user,
  group   => $perm_user,
  mode    => '0644',
  content => template('webserver/banco.php.erb'),
}
file { 'index.html':
  ensure => absent,
  path   => '/var/www/html/index.html',
}
}
