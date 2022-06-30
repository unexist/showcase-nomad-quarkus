job "infrastructure" {
  datacenters = ["dc1"]
  type        = "service"

  group "infrastructure" {
    network {
      port "db" { static = 5432 }
    }

    task "database" {
      driver = "podman"

      config {
        image        = "docker://postgres"
        network_mode = "host"
        ports        = ["db"]
      }

      env {
        POSTGRES_USER     = "root"
        POSTGRES_PASSWORD = "root"
      }

      service {
        name = "postgres"
        tags = ["postgres"]
        port = "db"

        check {
          name     = "alive"
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}