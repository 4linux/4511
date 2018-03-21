class notify {

file { 'CentOS-Plus.repo':
  path   => '/etc/yum.repos.d/CentOS-Plus.repo',
  ensure => present,
  owner  => 'root',
  group  => 'root',
  mode   => '0644',
  source => '/opt/4511/puppet/files/CentOS-Plus.repo',
  notify => Exec['yum makecache'],
 }
exec { 'yum makecache':
  path        => "/usr/bin:/usr/sbin:/bin",
  refreshonly => true,
 }
}

class {'notify':}
