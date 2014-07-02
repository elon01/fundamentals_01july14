# See http://docs.opscode.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "ebarevan"
client_key               "#{current_dir}/ebarevan.pem"
validation_client_name   "elon_01july14-validator"
validation_key           "#{current_dir}/elon_01july14-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/elon_01july14"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
