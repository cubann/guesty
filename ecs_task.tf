resource "aws_ecs_task_definition" "nginx" {
  family                = "nginx"
  container_definitions = <<EOF
      [{
        "name": "nginx",
        "image": "nginx",
        "memory": 8,
        "essential": true,
        "portMappings": [{"containerPort":80, "hostPort":80}]
      }]
      EOF
}

resource "aws_ecs_task_definition" "servers" {
  for_each              = toset(["first"])
  family                = each.key
  container_definitions = <<EOF
      [{
        "name": "${each.key}",
        "image": "public.ecr.aws/p7s6h2x4/cubannn:latest",
        "memory": 8,
        "essential": true,
        "portMappings": [{"containerPort":3000, "hostPort": 3000}],
        "environment": ${jsonencode([{ "name" = "IDENTITY", "value" = "test" }])}
      }]
      EOF
}
