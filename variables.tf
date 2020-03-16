## ECS Task Definition
variable "family" {
  description = "A unique name for your task definition."
}

variable "container_definitions" {
  description = "A list of valid container definitions provided as a single valid JSON document."
}

variable "task_role_arn" {
  description = "The ARN of IAM role that allows your Amazon ECS container task to make calls to other AWS services."
  default     = null
}

variable "execution_role_arn" {
  description = "The Amazon Resource Name (ARN) of the task execution role that the Amazon ECS container agent and the Docker daemon can assume."
  default     = null
}

variable "network_mode" {
  description = "The Docker networking mode to use for the containers in the task."
  default     = null
}

variable "ipc_mode" {
  description = "The IPC resource namespace to be used for the containers in the task"
  default     = null
}

variable "pid_mode" {
  description = "The process namespace to use for the containers in the task"
  default     = null
}

variable "volume" {
  description = "A set of volume blocks that containers in your task may use."
  type        = any
  default     = {}
}

variable "placement_constraints" {
  description = "A set of placement constraints rules that are taken into consideration during task placement."
  type        = any
  default     = []
}

variable "cpu" {
  description = "The number of cpu units used by the task."
  default     = null
}

variable "memory" {
  description = "The amount (in MiB) of memory used by the task. If the requires_compatibilities is FARGATE this field is required"
  default     = null
}

variable "requires_compatibilities" {
  description = "A set of launch types required by the task."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Resources Tags"
  type        = map(string)
}