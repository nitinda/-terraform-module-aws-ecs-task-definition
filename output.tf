output "arn" {
  value = "${aws_ecs_task_definition.core_ecs_task_definition.arn}"
}

output "family" {
  value = "${aws_ecs_task_definition.core_ecs_task_definition.family}"
}

output "revision" {
  value = "${aws_ecs_task_definition.core_ecs_task_definition.revision}"
}