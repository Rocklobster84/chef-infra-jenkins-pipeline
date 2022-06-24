# Chef InSpec test for recipe nodejs::default

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

# describe npm('npm_package_name') do
#  it { should be_installed }
# end

describe package('nodejs') do
  it { should be_installed }
end