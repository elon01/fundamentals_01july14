name "aar"
run_list "recipe[zip]", "recipe[mysql::server]", "recipe[aar-install]"
