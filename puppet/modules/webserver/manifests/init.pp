##### Classe para instalar e configurar servidor Web Apache
class webserver {
  include webserver::install
  include webserver::configure
  include webserver::service
}
