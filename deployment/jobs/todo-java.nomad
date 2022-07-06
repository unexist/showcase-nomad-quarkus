job "todo-java" {
  datacenters = ["dc1"]
  type        = "service"

  group "web" {
    count = 1

    task "service" {
      driver = "java"

      config {
        jar_path = "/Users/christoph.kappel/Projects/showcase-nomad-quarkus/target/showcase-nomad-quarkus-0.1-runner.jar"
        jvm_options = ["-Xmx2048m", "-Xms256m"]
      }
    }
  }
}