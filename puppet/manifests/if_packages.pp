if $osfamily == 'Debian' {
  package { 'elinks':
  ensure => present,
  }
}

else { 
  package { 'ntp':
  ensure => present,
  }
}
