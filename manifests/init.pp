class { 'nginx':
    service_manage => false,
}

nginx::resource::server { 'localhost':
    www_root => '/usr/share/nginx/html',
    listen_port => 8080,
}

class {'varnish':
    add_repo => false,
    varnish_listen_port => 80,
    varnish_storage_size => '1G',
}

varnish::backend { 'nginx':
    host => 'localhost',
    port => '8080',
}

