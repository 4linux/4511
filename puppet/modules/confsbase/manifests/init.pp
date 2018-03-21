##### Classe para padronizar usuarios, pacotes e hosts
class confsbase {
  include confsbase::users
  include confsbase::packages
  include confsbase::hosts
}
