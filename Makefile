.PHONY: test lint

all: lint test

lint: shellcheck yamllint

test:
	bats test

shellcheck:
	docker container run --rm -it -v $(shell pwd):/mnt koalaman/shellcheck\
		lab.sh\
		src/*

yamllint:
	docker run --rm -it -v $(shell pwd):/data cytopia/yamllint\
		-d "{extends: default, rules: {document-start: disable}}"\
		docker-compose.yml\
		etc/services/*
