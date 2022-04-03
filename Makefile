BRANCH = master

build:
	docker build -t natewalck/retronas:$(BRANCH) .

build_all:
	docker buildx build -t natewalck/retronas:$(BRANCH) --platform linux/arm64,linux/amd64,linux/riscv64,linux/ppc64le,linux/s390x,linux/386,linux/arm/v7,linux/arm/v6 .

push:
	docker push natewalck/retronas:$(BRANCH)

run:
	docker run -d --name retronas natewalck/retronas:$(BRANCH)

teardown:
	docker stop retronas && docker rm retronas

shell:
	docker exec -it retronas /bin/bash
