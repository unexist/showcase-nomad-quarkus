job "hello" {
  datacenters = ["dc1"]
  type        = "service"

  update {
    max_parallel = 1
    min_healthy_time = "10s"
    healthy_deadline = "3m"
    progress_deadline = "10m"
    auto_revert = false
    canary = 0
  }

  migrate {
    max_parallel = 1
    health_check = "checks"
    min_healthy_time = "10s"
    healthy_deadline = "5m"
  }

  group "hello" {
    count = 1

    network {
      port "http" {
        to = 8080
      }
    }

    restart {
      attempts = 2
      interval = "30m"
      delay = "15s"
      mode = "fail"
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
        image        = "oci-archive:/Users/christoph.kappel/Projects/showcase-nomad-quarkus/deployment/hello.oci"
        #image        = "docker://nginxdemos/hello"
        #network_mode = "host"
        ports = ["http"]
      }

      resources {
        cpu    = 500 # 500 MHz
        memory = 256 # 256MB
      }
    }
  }
}