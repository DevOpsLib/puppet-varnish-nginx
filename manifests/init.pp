class { 'nginx':
    service_manage => false,
    confd_only => true,
}

nginx::resource::server { 'localhost':
    proxy => 'http://localhost:81',
    listen_port => 8080,
}

$packages = [ 'epel-release', 'varnish' , 'augeas' ]

package { $packages:
    ensure => 'installed'
}

augeas { "sshd_config":
    changes => [
        "set /files/etc/nginx/conf.d/default.conf/server/listen 81",
    ],
}

