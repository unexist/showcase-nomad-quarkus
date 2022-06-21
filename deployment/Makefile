pd-build:
	podman build --format docker -t postgres-ram -f postgres-ram/Dockerfile

console-start:
	consul agent -dev

nd-start:
	#sudo nomad agent -dev -bind 0.0.0.0 -log-level INFO
	sudo nomad agent -dev -config nomad.config -network-interface en0

nd-infra:
	nomad job run infrastructure.nomad

nd-plugin:
	git clone git@github.com:hashicorp/nomad-driver-podman
	cd nomad-driver-podman
	make dev
	cp build/nomad-driver-podman ../nomad/plugins