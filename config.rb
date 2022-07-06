current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "rocklobster1984"
client_key               "#{current_dir}/rocklobster1984.pem"
chef_server_url          "https://api.chef.io/organizations/peer-rev"
cookbook_path            ["#{current_dir}/../cookbooks"]