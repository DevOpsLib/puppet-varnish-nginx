build-docker:
	docker build -t varnish-nginx .

destroy-docker:
	docker rm -f varnish-nginx

build-vagrant:
	vagrant up --provision

destroy-vagrant:
	vagrant destroy -f
