class before {

package { 'htop':
  ensure => present,
 }

user { 'helpdesk':
  ensure     => present,
  managehome => true, 
  password   => '$1$INGiS9eF$7Zo7aFo9QYIcOLbBcTpe4/',
  shell      => '/bin/bash', 
  before     => Package['htop'],
 }

}

class {'before':}
