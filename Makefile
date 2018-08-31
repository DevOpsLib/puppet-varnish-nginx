build-docker:
	docker build -t varnish-nginx .

run-docker:
	docker rm -f varnish-nginx && \
	docker run --name varnish-nginx -p 80:80 -d varnish-nginx && \
	docker logs -f varnish-nginx

destroy-docker:
	docker rm -f varnish-nginx

build-vagrant:
	vagrant up --provision

destroy-vagrant:
	vagrant destroy -f
