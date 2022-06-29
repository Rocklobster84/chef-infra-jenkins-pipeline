default['nodejs']['install_method'] = if platform?('debian')
                                        'package'
                                      else
                                        'source'
                                      end

default['nodejs']['version'] = '17.9.0'
