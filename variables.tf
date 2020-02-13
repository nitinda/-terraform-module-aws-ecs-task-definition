## ECS Task Definition
variable "family" {
  description = "A unique name for your task definition."
}

variable "container_definitions" {
  description = "A list of valid container definitions provided as a single valid JSON document."
}

variable "task_role_arn" {
  description = "The ARN of IAM role that allows your Amazon ECS container task to make calls to other AWS services."
}

variable "execution_role_arn" {
  description = "The Amazon Resource Name (ARN) of the task execution role that the Amazon ECS container agent and the Docker daemon can assume."
}

variable "network_mode" {
  description = "The Docker networking mode to use for the containers in the task."
}

variable "placement_constraints" {
  description = "A set of placement constraints rules that are taken into consideration during task placement."
  type        = "list"
  default     = []
}

variable "cpu" {
  description = "The number of cpu units used by the task."
}

variable "memory" {
  description = "The amount (in MiB) of memory used by the task. If the requires_compatibilities is FARGATE this field is required."
}

variable "requires_compatibilities" {
  description = "A set of launch types required by the task."
  type        = "list"
}

variable "volume" {
  description = "A set of volume blocks that containers in your task may use."
  type        = "list"
  default     = []
}

## Tags
variable tags {
  description = "Resources Tags"
  type        = "map"
}