
resource "aws_ecs_service" "nginx" {
  name            = "nginx"
  cluster         = aws_ecs_cluster.guesty.id
  task_definition = aws_ecs_task_definition.nginx.arn
  desired_count   = 1
  #   iam_role        = aws_iam_role.guesty.arn
  #   load_balancer {
  #     elb_name       = aws_elb.nginx.id
  #     container_name = "nginx"
  #     container_port = 80
  #   }
}

resource "aws_ecs_service" "servers" {
  for_each        = aws_ecs_task_definition.servers
  name            = each.key
  task_definition = each.value.arn
  desired_count   = 1
  cluster         = aws_ecs_cluster.guesty.id
  #   iam_role        = aws_iam_role.guesty.arn
  #   load_balancer {
  #     elb_name       = aws_elb.nginx.id
  #     container_name = "nginx"
  #     container_port = 80
  #   }
}