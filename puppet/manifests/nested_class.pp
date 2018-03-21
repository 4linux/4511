class app {
class infra {
  package { 'htop':
    ensure => 'installed',
    }
   }
class web {
  package { 'elinks':
    ensure => 'installed',
    }
  }
}

class { 'app::infra': }
class { 'app::web': }
