##### Classe para instalar pacotes base a partir do sistema operacional

class confsbase::packages {

$packages_debian = [ 'tzdata','dnsutils','bash-completion','unzip','bzip2','htop','vim','mlocate','nfs-common' ]
$packages_redhat = [ 'tzdata','bind-utils','unzip','bzip2','vim-enhanced','mlocate','htop','nfs-utils' ]

$packages = $facts['os']['family'] ? {
    'Debian' => $packages_debian,
    'RedHat' => $packages_redhat,
}

package { $packages:
  ensure => present,
}
}
