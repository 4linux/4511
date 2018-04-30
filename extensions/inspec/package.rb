describe package('openssh-server') do
  it { should be_installed }
  its('version') { should eq '7.4p1-11.el7' }
end
