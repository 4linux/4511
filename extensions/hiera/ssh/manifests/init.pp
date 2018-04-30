##### Modulos para configurar SSH via Hiera
class ssh {

$packages = lookup('packages')
$service = lookup('service')
$root_login = lookup('root_login')
$port_ssh = lookup('port_ssh')

package { $packages:
  ensure => present,
}
file { 'sshd_config':
    path    => '/etc/ssh/sshd_config',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('ssh/sshd_config.erb'),
    notify  => Service[$service]
}
service { $service:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
}
}
