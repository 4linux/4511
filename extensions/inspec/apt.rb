describe apt('http://security.debian.org/debian-security') do
  it { should exist }
  it { should be_enabled }
end
