resource "aws_iam_instance_profile" "guesty" {
  name = "guesty-profile-instance"
  role = aws_iam_role.guesty.name

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role" "guesty" {
  name               = "guesty-role"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.guesty.json

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role_policy" "guesty" {
  name   = "ecs_instance_role"
  role   = aws_iam_role.guesty.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ecs:CreateCluster",
        "ecs:DeregisterContainerInstance",
        "ecs:DiscoverPollEndpoint",
        "ecs:Poll",
        "ecs:RegisterContainerInstance",
        "ecs:StartTelemetrySession",
        "ecs:Submit*",
        "ecs:StartTask"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}
