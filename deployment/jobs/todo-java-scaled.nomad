job "todo" {
  datacenters = ["dc1"] # <1>

  group "web" { # <2>
    count = 5 # <3>

    task "todo" { # <4>
      driver = "java" # <5>

      config { # <6>
        jar_path = "/Users/christoph.kappel/Projects/showcase-nomad-quarkus/target/showcase-nomad-quarkus-0.1-runner.jar"
        jvm_options = ["-Xmx256m", "-Xms256m", "-Dquarkus.http.port=${NOMAD_PORT_http}"]
      }

      resources { # <7>
        memory = 256
      }
    }

    network { # <8>
      port "http" {}
    }
  }
}