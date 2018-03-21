$user_name = $facts['operatingsystem'] ? {
  'Debian' => 'devops',
  'CentOS' => 'monitor',
  'RedHat' => 'helpdesk',
  'Ubuntu' => 'backup',
  'default' => undef,
}

user { $user_name:
  ensure           => present,
  managehome       => true, 
  password         => '$1$INGiS9eF$7Zo7aFo9QYIcOLbBcTpe4/',
  password_max_age => '99999',
  password_min_age => '0', 
  shell		   => '/bin/bash', 
}
