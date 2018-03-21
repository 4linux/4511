##### Classe para instalar e configurar servidor de cache Memcached
class memcached {
  include memcached::install
  include memcached::configure
  include memcached::service
}
