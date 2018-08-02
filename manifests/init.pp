class { 'nginx': }

nginx::resource::server { 'localhost':
    www_root => '/usr/share/nginx/html',
    listen_port => 8080,
}


#class {'varnish':
#    varnish_listen_port => 80,
#    varnish_storage_size => '1G',
#}

#varnish::backend { 'nginx':
#    host => 'localhost',
#    port => '8080',
#}

