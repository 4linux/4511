##### Classe para adicionar os usuarios HelpDesk e Devops

class confsbase::users {
user { 'helpdesk':
  ensure           => 'present',
  comment          => 'HelDesk',
  home             => '/home/helpdesk',
  managehome       => true,
  password         => '$1$INGiS9eF$7Zo7aFo9QYIcOLbBcTpe4/',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
}
user { 'devops':
  ensure           => 'present',
  comment          => 'DevOps',
  home             => '/home/devops',
  managehome       => true,
  password         => '$1$INGiS9eF$7Zo7aFo9QYIcOLbBcTpe4/',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
}
}
