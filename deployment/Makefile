pd-build:
	podman build --format docker -t postgres-ram -f postgres-ram/Dockerfile

nd-start:
	#sudo nomad agent -dev -bind 0.0.0.0 -log-level INFO
	sudo nomad agent -dev -config nomad.config -network-interface en0

nd-infra:
	nomad job run infrastructure.nomad