job "todo-podman" {
  datacenters = ["dc1"]
  type        = "service"

  group "web" {
    count = 1

    network {
      port "quarkus" { to = 8080 }
    }

    task "service" {
      driver = "docker"

      config {
        image        = "showcase-nomad-quarkus:0.1"
        network_mode = "host"
        ports        = ["quarkus"]
      }
    }
  }
}