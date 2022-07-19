pd-hello:
	podman run -it --rm -p 8080:80/tcp nginxdemos/hello

pd-hello-test:
	curl http://localhost:8080

nd-todo-podman:
	nomad job run jobs/todo-podman.nomad

nd-todo-java:
	nomad job run jobs/todo-java.nomad

nd-todo-java-curl:
	curl --request POST --data @jobs/todo-java.json http://localhost:4646/v1/jobs

nd-todo-java-scale-up:
	nomad job scale todo-java

nd-todo-java-evals:
	nomad job status -evals todo-java

nd-plugin:
	git -C nomad-driver-podman pull || git clone --quiet git@github.com:hashicorp/nomad-driver-podman
	$(MAKE) -f GNUmakefile -C nomad-driver-podman dev
	cp nomad-driver-podman/build/nomad-driver-podman nomad/plugins
