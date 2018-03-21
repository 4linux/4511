class group {
  group { 'ti':
  ensure => 'present',  }
}
class user inherits group {
  user { 'operator':
  ensure => 'present',
  groups  => 'ti'
 }
}

class {'user': }
