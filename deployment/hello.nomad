job "infrastructure" {
  datacenters = ["dc1"]
  type        = "service"

  group "infrastructure" {

    task "hello" {
      driver = "podman"

      config {
        image        = "oci-archive:./hello-world.tar"
        network_mode = "host"
      }

      service {
        name = "hello"
        tags = ["hello"]
      }
    }
  }
}