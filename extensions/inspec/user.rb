describe user('root') do
  it { should exist }
  its('uid') { should eq 0 }
  its('gid') { should eq 0 }
  its('group') { should eq 'root' }
  its('home') { should eq '/root' }
  its('shell') { should eq '/bin/bash' }
  its('mindays') { should eq 0 }
  its('maxdays') { should eq 99999 }
  its('warndays') { should eq 7 }
end
