node 'devops.dexter.com.br' {
  include confsbase
}
node 'balancer.dexter.com.br' {
  include confsbase
  include balancer
  balancer::configure  { 'balancer.dexter.com.br': 
  web1  => '172.16.100.104',
  web2  => '172.16.100.105',
  cache => '172.16.100.106',
}
}
node 'webserver01.dexter.com.br' {
  include confsbase
  include webserver
  webserver::configure  { 'webserver01.dexter.com.br': 
  banco => '172.16.100.106',
  cache => '172.16.100.106',
}
}
node 'webserver02.dexter.com.br' {
  include confsbase
  include webserver
  webserver::configure  { 'webserver02.dexter.com.br': 
  banco => '172.16.100.106',
  cache => '172.16.100.106',
}
}
node 'database.dexter.com.br' {
  include confsbase
  include memcached
  include mysqlserver
}
