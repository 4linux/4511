describe filesystem('/') do
  its('size') { should be >= 32000 }
end
