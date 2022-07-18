job "todo-java" {
  datacenters = ["dc1"] # <1>

  group "web" { # <2>
    count = 1 # <3>

    task "todo-java" { # <4>
      driver = "java" # <5>

      config { # <6>
        jar_path = "/Users/christoph.kappel/Projects/showcase-nomad-quarkus/target/showcase-nomad-quarkus-0.1-runner.jar"
        jvm_options = ["-Xmx256m", "-Xms256m"]
      }

      resources { # <7>
        memory = 256
      }
    }
  }
}