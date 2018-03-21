package ['tzdata', 'bind-utils', 'unzip', 'bzip2', 'htop', 'vim-enhanced', 'mlocate', 'nfs-utils'] do
  action :install
  only_if { node['platform_family'] == 'rhel' }
end
