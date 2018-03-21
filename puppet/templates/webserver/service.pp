##### Classe para gerenciar o servico do Apache

class webserver::service {

$packages_debian = [ 'apache2', 'php', 'php-mysql', 'php-memcache' ]
$packages_redhat = [ 'httpd', 'php', 'php-mysql', 'php-pecl-memcached' ]

$packages = $facts['os']['family'] ? {
    'Debian' => $packages_debian,
    'RedHat' => $packages_redhat,
}
$conf_name = $facts['os']['family'] ? {
    'Debian' => 'php-memcached-debian.ini.erb',
    'RedHat' => 'php-memcached-redhat.ini.erb',
}
$service_name = $facts['os']['family'] ? {
    'Debian' => 'apache2',
    'RedHat' => 'httpd',
}
service { $service_name:
  ensure     => running,
  enable     => true,
  hasrestart => true,
  hasstatus  => true,
  require    => Package[$packages],
  subscribe  => File[$conf_name]
}
}
