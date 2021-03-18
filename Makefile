build:
	docker build --rm -t docker-cups:2.2.1 .

push:
	docker tag docker-cups:2.2.1 registry.io.imim.cloud/docker-cups:2.2.1
	docker push registry.io.imim.cloud/docker-cups:2.2.1

