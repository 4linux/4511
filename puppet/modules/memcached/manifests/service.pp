##### Classe para gerenciar o servico do memcached

class memcached::service {

$conf_name = $facts['os']['family'] ? {
    'Debian' => 'memcached-debian.conf',
    'RedHat' => 'memcached-redhat.conf',
}

service { 'memcached':
  ensure     => running,
  enable     => true,
  hasrestart => true,
  hasstatus  => true,
  require    => Package['memcached'],
  subscribe  => File[$conf_name]
}
}
