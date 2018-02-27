all: tor-ingress-controller

tor-ingress-controller: vendor main.go tor/*.go
	go build -i -o tor-ingress-controller

vendor: Gopkg.toml
	dep ensure

docker:
	docker build . -t kragniz/tor-ingress-controller:latest

push:
	docker push kragniz/tor-ingress-controller:latest
