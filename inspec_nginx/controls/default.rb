# copyright: 2022, Stephanie Thompson

title 'NGINX Controls'

nginx_params = yaml(content: inspec.profile.file('params.yml')).params

required_version = nginx_params['version']
required_modules = nginx_params['modules']

# you add controls here
control 'nginx-version' do                        # A unique ID for this control
  impact 1.0                                      # The criticality, if this control fails.
  title 'NGINX Verion Number'                     # A human-readable title
  desc 'Checking the version of NGINX that is installed'
  describe nginx do                               # The actual test
    its('version') { should cmp >= required_version }
  end
end

control 'nginx-modules' do
  impact 1.0
  title 'NGINX Modules'
  desc 'Required modules for NGINX should be installed'
  describe nginx do
    required_modules.each do |required_module|
      its('modules') { should include required_module }
    end
  end
end

control 'nginx-conf' do
  impact 1.0
  title 'NGINX Config Check'
  desc 'The NGINX config file should be owned by root and in root group, not writable, readable, or executable by any others.'
  describe file('/etc/nginx/nginx.conf') do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should_not be_readable.by('others') }
    it { should_not be_writable.by('others') }
    it { should_not be_executable.by('others') }
  end
end
