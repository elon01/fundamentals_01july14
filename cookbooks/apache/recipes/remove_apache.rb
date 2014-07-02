service "httpd" do
	action :stop
end

package "httpd" do
	action :remove
end

directory "/etc/httpd" do
	action :delete
	recursive true
end

