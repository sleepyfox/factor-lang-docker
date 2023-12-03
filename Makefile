.PHONY: all echo clean build tag push shell repl

DOCKER_USER=sleepyfox
IMAGE=factor-dev
VERSION=0.99-ubuntu24.04

all: build tag push

echo:
	@ echo "DOCKER_USER set to $(DOCKER_USER)"
	@ echo "IMAGE set to $(IMAGE)"
	@ echo "VERSION set to $(VERSION)"

clean:
	rm -f *~

build:
	docker build \
	-t $(DOCKER_USER)/$(IMAGE):$(VERSION) .

tag:
	docker tag $(DOCKER_USER)/$(IMAGE):$(VERSION) $(DOCKER_USER)/$(IMAGE):latest

push:
	docker push $(DOCKER_USER)/$(IMAGE):$(VERSION)
	docker push $(DOCKER_USER)/$(IMAGE):latest

shell:
	docker run -it \
	-v `pwd`:/home/ubuntu \
	$(DOCKER_USER)/$(IMAGE):$(VERSION) \
	bash

repl:
	docker run -it \
	-v `pwd`:/home/ubuntu \
	$(DOCKER_USER)/$(IMAGE):$(VERSION) \
	factor

test:
	docker run -it \
	-v `pwd`:/home/ubuntu \
	$(DOCKER_USER)/$(IMAGE):$(VERSION) \
	factor test.factor
