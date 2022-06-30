# Chef InSpec test for recipe jenkins::default

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

describe file('/root/.jenkins/secrets/initialAdminPassword') do
  it { should exist }
end

describe command('curl localhost:8080') do
  its('stdout') { should match(/hudson/) }
end
