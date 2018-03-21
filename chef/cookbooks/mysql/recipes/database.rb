bash 'mysql_secure_installation' do
  code <<-EOC
    mysql -sfu root < /tmp/mysql_secure_installation.sql
  EOC
  not_if 'mysql -u root -p4linux'
end

bash 'mysql_database_create' do
  code <<-EOC
    mysql -u root -p4linux -e "CREATE DATABASE dexter500;"
  EOC
  not_if "mysql -u root -p4linux -e 'SHOW DATABASES;' | grep dexter500"
end

bash 'mysql_import_tables' do
  code <<-EOC
    mysql -u root -p4linux dexter500 < /tmp/dump.sql
  EOC
  not_if "mysql -u root -p4linux -e 'SELECT * FROM funcionarios;'"
end

bash 'mysql_user_create' do
  code <<-EOC
    mysql -u root -p4linux -e "GRANT ALL ON dexter500.* TO 'admin'@'localhost' IDENTIFIED BY '4linux';"
    mysql -u root -p4linux -e "GRANT ALL ON dexter500.* TO 'admin'@'%' IDENTIFIED BY '4linux';"
    mysql -u root -p4linux -e "GRANT ALL ON dexter500.* TO 'admin'@'testing.dexter.com.br' IDENTIFIED BY '4linux';"
    mysql -u root -p4linux -e "GRANT ALL ON dexter500.* TO 'admin'@'homolog.dexter.com.br' IDENTIFIED BY '4linux';"
    mysql -u root -p4linux -e "GRANT ALL ON dexter500.* TO 'admin'@'database.dexter.com.br' IDENTIFIED BY '4linux';"
    mysql -u root -p4linux -e "FLUSH PRIVILEGES;"
  EOC
end
