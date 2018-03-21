##### Classe para instalar e configurar servidor de banco de dados MySQL
class mysqlserver {
  include mysqlserver::install
  include mysqlserver::configure
  include mysqlserver::service
  include mysqlserver::database
}
