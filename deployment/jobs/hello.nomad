job "hello" {
  datacenters = ["dc1"]
  type        = "service"

  group "hello" {
    count = 1

    network {
      port "http" {
        to = 8080
      }
    }

    service {
      name = "hello"
      tags = ["hello"]

      check {
        type     = "http"
        port     = "http"
        path     = "/"
        interval = "5s"
        timeout  = "2s"
      }
    }

    task "hello" {
      driver = "podman"

      config {
        image = "docker://nginxdemos/hello"
        ports = ["http"]
      }
    }
  }
}