##### Classe para instalar pacotes base

class confsbase::packages {

$packages = [ 'tzdata','dnsutils','bash-completion','unzip','bzip2','htop','vim','mlocate','nfs-common' ]
package { $packages:
  ensure => present,
}
}
