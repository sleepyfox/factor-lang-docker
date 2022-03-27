.PHONY: all echo clean build tag push shell repl

DOCKER_USER=sleepyfox
IMAGE=factor-dev
VERSION=0.98-ubuntu22.04
UID=`id -u`
GID=`id -g`
OS_USER=`whoami`

all: build tag push

echo:
	@ echo "DOCKER_USER set to $(DOCKER_USER)"
	@ echo "IMAGE set to $(IMAGE)"
	@ echo "VERSION set to $(VERSION)"
	@ echo "UID set to $(UID)"
	@ echo "GID set to $(GID)"
	@ echo "OS_USER set to $(OS_USER)"

clean:
	rm -f *~

build:
	docker build \
	--build-arg USER=$(OS_USER) \
	--build-arg UID=$(UID) \
	--build-arg GID=$(GID) \
	-t $(DOCKER_USER)/$(IMAGE):$(VERSION) .

tag:
	docker tag $(DOCKER_USER)/$(IMAGE):$(VERSION) $(DOCKER_USER)/$(IMAGE):latest

push:
	docker push $(DOCKER_USER)/$(IMAGE):$(VERSION)
	docker push $(DOCKER_USER)/$(IMAGE):latest

shell:
	docker run -it \
	-v `pwd`:/var/app \
	$(DOCKER_USER)/$(IMAGE):$(VERSION) \
	bash

repl:
	docker run -it \
	-v `pwd`:/var/app \
	$(DOCKER_USER)/$(IMAGE):$(VERSION) \
	factor
