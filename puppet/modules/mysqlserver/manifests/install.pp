##### Classe para instalar pacote mariadb-server

class mysqlserver::install {

package { 'mariadb-server':
  ensure => present,
}
}
