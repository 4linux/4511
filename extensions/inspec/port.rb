describe port(22) do
  it { should be_listening }
  its('processes') {should include 'sshd'}
end
