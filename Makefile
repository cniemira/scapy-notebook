TAG = siege/scapy-notebook:latest

NOW = $(shell /bin/date '+%Y%m%d-%H%M')

docker = /usr/local/bin/docker
sed = /usr/bin/sed

.PHONY: build update run

build: Dockerfile update
	$(docker) build -t $(TAG) .

push: Dockerfile
	$(docker) push $(TAG)

update: Dockerfile
	$(sed) -i '' -e 's/\(ENV updated\) .*/\1 $(NOW)/' Dockerfile

run: Dockerfile
	$(docker) run -d -p 8888:8888 $(TAG) start-notebook.sh --NotebookApp.token=''

