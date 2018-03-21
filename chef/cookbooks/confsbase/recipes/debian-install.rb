package ['tzdata', 'dnsutils', 'bash-completion', 'unzip', 'bzip2', 'htop', 'vim', 'mlocate', 'nfs-common'] do
  action :install
  only_if { node['platform_family'] == 'debian' }
end
