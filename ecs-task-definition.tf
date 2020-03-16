resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                = var.family
  container_definitions = var.container_definitions
  task_role_arn         = var.task_role_arn
  execution_role_arn    = var.execution_role_arn
  network_mode          = var.network_mode

  dynamic "volume" {
    for_each = length(keys(var.volume)) == 0 ? [] : [var.volume]
    content {
      host_path = lookup(volume.value, "host_path", null)
      name      = volume.value.name

      dynamic "docker_volume_configuration" {
        for_each = length(keys(lookup(volume.value, "docker_volume_configuration", []))) == 0 ? [] : [lookup(volume.value, "docker_volume_configuration", [])]
        content {
          autoprovision = lookup(docker_volume_configuration.value, "autoprovision", null)
          driver        = lookup(docker_volume_configuration.value, "driver", null)
          driver_opts   = lookup(docker_volume_configuration.value, "driver_opts", null)
          labels        = lookup(docker_volume_configuration.value, "labels", null)
          scope         = lookup(docker_volume_configuration.value, "scope", null)
        }
      }

      dynamic "efs_volume_configuration" {
        for_each = length(keys(lookup(volume.value, "efs_volume_configuration", []))) == 0 ? [] : [lookup(volume.value, "efs_volume_configuration", [])]
        content {
          file_system_id = efs_volume_configuration.value.file_system_id
          root_directory = lookup(efs_volume_configuration.value, "root_directory", null)
        }
      }
    }
  }

  dynamic "placement_constraints" {
    for_each = var.placement_constraints
    content {
      expression = lookup(placement_constraints.value, "expression", null)
      type       = placement_constraints.value.type
    }
  }

  requires_compatibilities = var.requires_compatibilities
  cpu                      = var.cpu
  memory                   = var.memory

  tags = var.tags
}