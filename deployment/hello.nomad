job "infrastructure" {
  datacenters = ["dc1"]
  type        = "service"

  group "infrastructure" {

    task "hello" {
      driver = "podman"

      config {
        image = "docker://hello-world"
        network_mode = "host"
      }

      service {
        name = "hello"
        tags = ["hello"]
      }
    }
  }
}