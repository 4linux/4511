node 'testing.dexter.com.br' {

user { 'helpdesk': 
  ensure           => 'present', 
  comment          => 'HelDesk', 
  home             => '/home/helpdesk', 
  managehome       => true, 
  password         => '$1$INGiS9eF$7Zo7aFo9QYIcOLbBcTpe4/',
  password_max_age => '99999',
  password_min_age => '0', 
  shell		   => '/bin/bash', 
 }

user { 'devops': 
  ensure           => 'present', 
  comment          => 'DevOps', 
  home             => '/home/devops', 
  managehome       => true, 
  password         => '$1$INGiS9eF$7Zo7aFo9QYIcOLbBcTpe4/',
  password_max_age => '99999',
  password_min_age => '0', 
  shell		   => '/bin/bash', 
 }

$packages = [ 'tzdata','dnsutils','bash-completion','unzip','bzip2','htop','vim','mlocate','nfs-common' ]

package { $packages:
  ensure => present,
  }

file { 'hosts':
  ensure => present,
  path   => '/etc/hosts',
  mode   => '0664',
  content => ' ' 
  }

  host { 'localhost.localdomain':
    ip           => '127.0.0.1',
    host_aliases => 'localhost',
  }

  host { 'devops.dexter.com.br':
    ip           => '172.16.100.100',
    host_aliases => 'devops',
  }

  host { 'testing.dexter.com.br':
    ip           => '172.16.100.101',
    host_aliases => 'testing',
  }

  host { 'homolog.dexter.com.br':
    ip           => '172.16.100.102',
    host_aliases => 'homolog',
  }

  host { 'balancer.dexter.com.br':
    ip           => '172.16.100.103',
    host_aliases => 'balancer',
  }

  host { 'webserver01.dexter.com.br':
    ip           => '172.16.100.104',
    host_aliases => 'webserver01',
  }

  host { 'webserver02.dexter.com.br':
    ip           => '172.16.100.105',
    host_aliases => 'webserver02',
  }

  host { 'database.dexter.com.br':
    ip           => '172.16.100.106',
    host_aliases => 'database',
  }

  host { 'ansible-server.dexter.com.br':
    ip           => '172.18.0.101',
    host_aliases => 'ansible-server',
  }

  host { 'chef-server.dexter.com.br':
    ip           => '172.18.0.102',
    host_aliases => 'chef-server',
  }

  host { 'chef-workstation.dexter.com.br':
    ip           => '172.18.0.103',
    host_aliases => 'chef-workstation',
  }
}
