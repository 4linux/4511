##### Classe para instalar pacotes do Apache com suporte a PHP

class webserver::install {

$packages_debian = [ 'apache2', 'php', 'php-mysql', 'php-memcache' ]
$packages_redhat = [ 'httpd', 'php', 'php-mysql', 'php-pecl-memcached' ]

$packages = $facts['os']['family'] ? {
    'Debian' => $packages_debian,
    'RedHat' => $packages_redhat,
}

package { $packages:
  ensure => present,
}
}
