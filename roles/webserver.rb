name "webserver"
description "Web Server"
run_list "role[base]", "recipe[apache]"
override_attributes({
	"apache" => {
		"sites" => {
			"admin" => {
				"port" => 8000
			},
			"amitan" => {
				"port" => 8080
			},
			"bears" => {
				"port" => 8081
			}
		}
	}
})
