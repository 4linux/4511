class require {

file { "/opt/arquivos":
  ensure => directory
 }
file {'/opt/arquivos/olamundo':
  ensure  => present,
  mode    => '0755',
  require => File["/opt/arquivos"],
  content => "Eu sou um arquivo de teste\n",
 }
}

class {'require':}
