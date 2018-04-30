##### Modulo para instalar pacotes no Windows
class winpackages {
package { "winscp":
  ensure    => installed,
  provider  => chocolatey,
}
package { "putty":
  ensure    => installed,
  provider  => chocolatey,
}
}
