provider "aws" {
  region = "us-east-2"
}

resource "aws_ecs_cluster" "guesty" {
  name = "guesty_cluster"
}
