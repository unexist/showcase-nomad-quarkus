pd-hello:
	podman run -it --rm -p 8080:80/tcp nginxdemos/hello

pd-hello-test:
	curl http://localhost:8080

nd-todo-podman:
	nomad job run jobs/todo-podman.nomad

nd-todo-jar:
	nomad job run jobs/todo-jar.nomad

nd-plugin:
	git -C nomad-driver-podman pull || git clone --quiet git@github.com:hashicorp/nomad-driver-podman
	$(MAKE) -f GNUmakefile -C nomad-driver-podman dev
	cp nomad-driver-podman/build/nomad-driver-podman nomad/plugins