DOCKER_USERNAME=dawi2332
DOCKER_NAME=ubuntu.rsyslog
DOCKER_TAG=$(DOCKER_USERNAME)/$(DOCKER_NAME)

.PHONY=all deps build

all:

deps:

push: build
	docker push $(DOCKER_TAG)

build: deps
	docker build -t $(DOCKER_TAG) .

