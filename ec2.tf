# resource "aws_iam_policy_attachment" "guesty_ec2" {
#   name       = "guesty_ec2_iam_policy_attachment"
#   roles      = ["${aws_iam_role.guesty_ec2.id}"]
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
# }

# resource "aws_launch_configuration" "guesty_ec2" {
#   name_prefix   = "guesty-ec2-"
#   instance_type = "t2.micro"
#   image_id      = data.aws_ami.ecs_ami.id
# }

# resource "aws_autoscaling_group" "ecs_cluster_instances" {
#   availability_zones   = ["us-east-2a"]
#   name                 = "ecs-cluster-instances"
#   min_size             = 1
#   max_size             = 1
#   launch_configuration = aws_launch_configuration.guesty_ec2.name
# }

resource "aws_instance" "guesty" {
  ami                  = data.aws_ami.ecs_ami.id
  instance_type        = "t2.micro"
  key_name             = "guesty"
  user_data            = <<EOF
#!/bin/bash
echo ECS_CLUSTER=${aws_ecs_cluster.guesty.name} >> /etc/ecs/ecs.config
EOF
  iam_instance_profile = aws_iam_instance_profile.guesty.name
}