class ntp {

package { 'ntp':
  ensure => present,
 }

}

class {'ntp': }
