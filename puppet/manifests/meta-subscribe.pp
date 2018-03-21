class subscribe {

package { 'ntp':
  ensure => present,
 }
file { 'ntp.conf':
  path   =>'/etc/ntp.conf',
  ensure => present, 
  owner  => 'root',
  group  => 'root',
  mode   => '0644',
  source => '/opt/4511/puppet/files/ntp.conf',
 }
service { "ntpd":
  ensure    => running,
  subscribe => File['ntp.conf']
 }
}

class {'subscribe':}
