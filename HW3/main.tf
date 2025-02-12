terraform {
  required_version = ">= 1.7.2"
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Build a Docker image from hello_http-main/Dockerfile
resource "docker_image" "hello_http" {
  name         = "hello_http_image"
  keep_locally = false

  build {
    context    = "${path.module}/hello_http-main"
    dockerfile = "Dockerfile"
  }
}

# Run a container from the built image
resource "docker_container" "hello_http" {
  image = docker_image.hello_http.image_id
  name  = "hello_http_container"

  ports {
    internal = 8081
    external = 8081
  }
}

# Output the built image ID
output "image_id" {
  value = docker_image.hello_http.image_id
}
