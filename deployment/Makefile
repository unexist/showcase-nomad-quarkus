pd-build:
	podman build --format docker -t postgres-ram -f postgres-ram/Dockerfile

pd-hello:
	podman run -it --rm -p 8080:80/tcp nginxdemos/hello

pd-hello-test:
	curl http://localhost:8080

nd-infra:
	nomad job run infrastructure.nomad

nd-hello:
	podman save -o oci-archive -o hello.oci nginxdemos/hello
	nomad job run hello.nomad

nd-plugin:
	git -C nomad-driver-podman pull || git clone --quiet git@github.com:hashicorp/nomad-driver-podman
	$(MAKE) -f GNUmakefile -C nomad-driver-podman dev
	cp nomad-driver-podman/build/nomad-driver-podman nomad/plugins