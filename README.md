# Lab - Puppet - Varnish - NGinx

The basic idea here is to create a solution using Varnish to cache responses from a service running in the [URL defined here](https://github.com/DevOpsLib/puppet-varnish-nginx/blob/master/manifests/init.pp#L7).

Because Varnish (FREE) only accepts one backend address and I want more control around the backend requests (like DNS, header changing), I also setup a NGinx as reverse proxy and linked to Varnish.

All configurations are powered by Puppet Modules and only feel configs were needed to make it works, to test you can use Docker or Vagrant and see how that it goes.


Usage with Docker:

```
make build-docker
make run-docker
```
[ACCESS HERE](http://localhost:80)


Usage with Vagrant:

```
make build-vagrant
```
[ACCESS HERE](http://localhost:8080)



Enjoy! :)
