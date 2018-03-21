user 'helpdesk' do
  action :create
  comment 'HelpDesk'
  home '/home/helpdesk'
  shell '/bin/bash'
  password '$1$ZJ4HVScg$uuddVUdmBk12AxM6Qmrf5/'
end
user 'devops' do
  action :create
  comment 'DevOps'
  home '/home/devops'
  shell '/bin/bash'
  password '$1$ZJ4HVScg$uuddVUdmBk12AxM6Qmrf5/'
end
package ['tzdata', 'dnsutils', 'bash-completion', 'unzip', 'bzip2', 'htop', 'vim', 'mlocate', 'nfs-common'] do
  action :install
end
cookbook_file '/etc/hosts' do
  source 'hosts'
  owner 'root'
  group 'root'
  mode '0644'
end
