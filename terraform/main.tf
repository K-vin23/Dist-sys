terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.23.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "springboot_image_pay" {
    name = "springboot-pay"

    build{
        path = "../jdk-docker"
        dockerfile = "Dockerfile"
    }

}

resource "docker_image" "springboot_image_ord" {
    name = "springboot-ord"

    build{
        path = "../jdk-docker-2"
        dockerfile = "Dockerfile"
    }

}

resource "docker_image" "springboot_image_dom" {
    name = "springboot-dom"

    build{
        path = "../jdk-docker-3"
        dockerfile = "Dockerfile"
    }

}

resource "docker_container" "springboot_pay" {
  image = docker_image.springboot_image_pay.image_id
  name  = "springapipay"
  ports {
    internal = 8081
    external = 8081
  }
}

resource "docker_container" "springboot_ord" {
  image = docker_image.springboot_image_ord.image_id
  name  = "springapiord"
  ports {
    internal = 8090
    external = 8090
  }
}

resource "docker_container" "springboot_dom" {
  image = docker_image.springboot_image_dom.image_id
  name  = "springapidom"
  ports {
    internal = 8091
    external = 8091
  }
}

resource "docker_image" "nodejs_image" {
    name = "nodejs-app"

    build{
        path = "../nodejs-docker"
        dockerfile = "Dockerfile"
    }

}

resource "docker_container" "nodejs" {
  image = docker_image.nodejs_image.image_id
  name  = "nodeapi"
  ports {
    internal = 8080
    external = 8080
  }
}

resource "docker_image" "python_image" {
    name = "python-app"

    build{
        path = "../python-docker"
        dockerfile = "Dockerfile"
    }

}

resource "docker_container" "python" {
  image = docker_image.python_image.image_id
  name  = "pythontest"
}

resource "docker_image" "rabbitmq_image" {
    name = "rabbitmq:3-management"

}

resource "docker_container" "rabbitmq" {
  image = docker_image.rabbitmq_image.image_id
  name  = "rabbitservice"
  hostname = "myrabbit"
  env = ["RABBITMQ_DEFAULT_USER=user", "RABBITMQ_DEFAULT_PASS=password"]
}

resource "docker_image" "kong_image" {
    name = "kong/kong-gateway"

}

resource "docker_container" "kong" {
  image = docker_image.kong_image.image_id
  name  = "kongservice"
  ports {
      internal = 8000
      external = 8000
    }
  ports {
      internal = 8443
      external = 8443
    }
  ports {
      internal = 8444
      external = 8444
    }
    env = ["KONG_DATABASE=off", "KONG_PROXY_ACCESS_LOG=/dev/stdout", "KONG_ADMIN_ACCESS_LOG=/dev/stdout", "KONG_PROXY_ERROR_LOG=/dev/stderr", "KONG_ADMIN_ERROR_LOG=/dev/stderr", "KONG_ADMIN_LISTEN=0.0.0.0:8000, 0.0.0.0:8444 ssl"]
}

resource "docker_image" "postgres_image" {
    name = "porterpostgre"

    build{
        path = "../postgres-docker"
        dockerfile = "Dockerfile"
    }

}

resource "docker_container" "postgresql" {
  image = docker_image.postgres_image.image_id
  name  = "postgresql"
  ports {
      internal = 9876
      external = 9876
    }

  env = ["POSTGRES_PASSWORD=0002"]
}

