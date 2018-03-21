##### Classe para instalar pacotes memcached

class memcached::install {

package { 'memcached':
  ensure => present,
}
}
