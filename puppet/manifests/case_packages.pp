case $operatingsystem {
  'CentOS', 'RedHat': {
     $package_name = 'elinks'
  }
  'Debian', 'Ubuntu': {
     $package_name = 'ntp'
  }
}

package { $package_name:
  ensure => present,
}
