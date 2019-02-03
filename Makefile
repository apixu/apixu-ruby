.PHONY: env run test

ifndef RUBYVERSION
RUBYVERSION=2
endif

ifndef APIXUKEY
$(error APIXUKEY is not set)
endif

IMAGE=ruby:$(RUBYVERSION)

env:
	docker run --rm -ti -v $(CURDIR):/src -w /src -e APIXUKEY=$(APIXUKEY) -e RUBYLIB=/src/lib $(IMAGE) sh -c 'bundle && bash'

run:
	docker run --rm -ti -v $(CURDIR):/src -w /src -e APIXUKEY=$(APIXUKEY) -e RUBYLIB=/src/lib $(IMAGE)  sh -c './bin/setup && ruby $(FILE)'

test:
	docker run --rm -ti -v $(CURDIR):/src -w /src -e APIXUKEY=$(APIXUKEY) $(IMAGE) sh -c './bin/setup; rake'
