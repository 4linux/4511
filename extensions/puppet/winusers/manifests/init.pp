##### Modulo para adicionar usuarios no Windows
class winusers {
  user { 'backup':
    ensure   => 'present',
    groups   => 'Users',
    comment  => 'Backup DevOps',
    password => '4LinuxExtensions',
}
  user { 'bigdata':
    ensure   => 'present',
    groups   => 'Users',
    comment  => 'Big Data',
    password => '4LinuxExtensions',
}
}
