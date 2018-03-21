##### Classe para gerenciar configuracao do memcached

class memcached::configure {

$conf_name = $facts['os']['family'] ? {
    'Debian' => 'memcached-debian.conf.erb',
    'RedHat' => 'memcached-redhat.conf.erb',
}
$path_file = $facts['os']['family'] ? {
    'Debian' => '/etc/memcached.conf',
    'RedHat' => '/etc/sysconfig/memcached',
}

file { $conf_name:
  ensure  => present,
  path    => $path_file,
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  content => template("memcached/${conf_name}"),
  notify  => Service['memcached']
}
}
