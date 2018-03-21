##### Classe para gerenciar configuracao do Nginx
define balancer::configure(
        String $cache,
        String $web1,
        String $web2,
) {

$conf_name = $facts['os']['family'] ? {
    'Debian' => 'nginx-debian.conf.erb',
    'RedHat' => 'nginx-redhat.conf.erb',
}
file { $conf_name:
  ensure  => present,
  path    => '/etc/nginx/nginx.conf',
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  content => template("balancer/${conf_name}"),
  notify  => Service['nginx']
}
}
