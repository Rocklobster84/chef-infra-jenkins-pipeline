# copyright: 2022, Stephanie Thompson

title 'Jenkins Controller'

# you add controls here
control 'java' do                                  # A unique ID for this control
  impact 1.0                                       # The criticality, if this control fails.
  title 'Java 11 Installation'                     # A human-readable title
  desc 'Checking that Java 11 is installed'
  describe packages(/open-jdk/) do                               # The actual test
    its('versions') { should cmp '11.0.15' }
  end
end
