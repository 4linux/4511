describe file('/etc/hosts') do
 it { should exist }
 its('content') { should match(%r{127.0.0.1\s.*?localhost}) }
 its('mode') { should cmp '0644' }
end
