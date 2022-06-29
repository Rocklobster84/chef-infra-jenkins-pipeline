case node['platform']
when 'debian', 'ubuntu'
  default['nodejs']['install_repo'] = true
  default['nodejs']['repo']         = 'https://deb.nodesource.com/setup_18.x'
when 'redhat', 'centos'
  default['nodejs']['install_repo'] = true
  default['nodejs']['repo']         = 'https://rpm.nodesource.com/setup_18.x'
  default['nodejs']['key']          = 'https://rpm.nodesource.com/pub/el/NODESOURCE-GPG-SIGNING-KEY-EL'
end

default['nodejs']['package_action'] = { default: :install }
