##### Classe para instalar e configurar Nginx

class balancer {

$conf_name = $facts['os']['family'] ? {
    'Debian' => 'nginx-debian.conf.erb',
    'RedHat' => 'nginx-redhat.conf.erb',
}
package { 'nginx':
  ensure => present,
}
service { 'nginx':
  ensure     => running,
  enable     => true,
  hasrestart => true,
  hasstatus  => true,
  require    => Package['nginx'],
  subscribe  => File[$conf_name]
}
}
