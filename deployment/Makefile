pd-build:
	podman build --format docker -t postgres-ram -f postgres-ram/Dockerfile

console-start:
	consul agent -dev

nd-start:
	#sudo nomad agent -dev -bind 0.0.0.0 -log-level INFO
	sudo nomad agent -dev -config nomad.config -network-interface en0

nd-infra:
	nomad job run infrastructure.nomad

nd-hello:
	podman save -o oci-archive -o hello-world.tar hello-world
	nomad job run hello.nomad

nd-plugin:
	git -C nomad-driver-podman pull || git clone --quiet git@github.com:hashicorp/nomad-driver-podman
	$(MAKE) -f GNUmakefile -C nomad-driver-podman dev
	cp nomad-driver-podman/build/nomad-driver-podman nomad/plugins