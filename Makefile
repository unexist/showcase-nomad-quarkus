define JSON_TODO
curl -X 'POST' \
  'http://localhost:8080/todo' \
  -H 'accept: */*' \
  -H 'Content-Type: application/json' \
  -d '{
  "description": "string",
  "done": true,
  "dueDate": {
    "due": "2021-05-07",
    "start": "2021-05-07"
  },
  "title": "string"
}'
endef
export JSON_TODO

# Tools
rest-create:
	@echo $$JSON_TODO | bash

rest-list:
	@curl -X 'GET' 'http://localhost:8090/todo' -H 'accept: */*' | jq .

# Env
env-testcontainers:
	launchctl setenv TESTCONTAINERS_CHECKS_DISABLE true
	launchctl setenv TESTCONTAINERS_RYUK_DISABLED true
	launchctl setenv TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE unix://${HOME}/.local/share/containers/podman/machine/podman-machine-default/podman.sock

env-podman:
	launchctl setenv DOCKER_HOST unix://${HOME}/.local/share/containers/podman/machine/podman-machine-default/podman.sock

# Podman
pd-start:
	podman machine start

pd-jib: env-podman env-testcontainers
	mvn package -Dquarkus.container-image.build=true

pd-jib-push: env-podman env-testcontainers
	mvn clean
	mvn package -Dquarkus.container-image.build=true -Dquarkus.container-image.push=true

# Nomad
nd-status:
	nomad node status

nd-open:
	open http://localhost:4646

nd-consul-start:
	consul agent -dev -log-level=INFO -log-file=deployment/nomad/logs/consul.log &

nd-vault-start:
	vault agent &

nd-start: nd-consul-start
	nomad agent -dev -config deployment/nomad.config -network-interface en0