default['nodejs']['install_method'] = case node['platform']
when 'debian'
    'package'
else
    'source'
end

default['nodejs']['version'] = '17.9.0'