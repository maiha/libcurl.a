SHELL = /bin/bash
.SHELLFLAGS = -o pipefail -c

CURL_VERSION ?= 7_68_0

export LC_ALL=C
export UID = $(shell id -u)
export GID = $(shell id -g)

all: libcurl.a

console:
	docker-compose run --rm curl-builder sh

libcurl.a:
	docker-compose run --rm curl-builder ./build "curl-$(CURL_VERSION)"

clean:
	@rm -f libcurl*
	@[ -d curl ] && (cd curl && make clean)
