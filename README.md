# _Terraform Module: terraform-module-aws-ecs-task-definition_

<!--BEGIN STABILITY BANNER-->
---

![_Code : Stable_](https://img.shields.io/badge/Code-Stable-brightgreen?style=for-the-badge&logo=github)

> **_This is a stable example. It should successfully build out of the box_**
>
> _This examples does is built on Construct Libraries marked "Stable" and does not have any infrastructure prerequisites to build._

---
<!--END STABILITY BANNER-->


## _General_

_This module can be used to deploy a_**_ECS Task Definition_** _on AWS Cloud Provider......_


---

## _Prerequisites_

_This module needs **Terraform 0.12.19** or newer._
_You can download the latest Terraform version from_ [_here_](https://www.terraform.io/downloads.html).



---

## _Features Branches_

_Below we are able to check the resources that are being created as part of this module call:_

- _**ECS Task Definition**_


---

## _Usage_

## _Using this repo_

_To use this module, add the following call to your code:_

```tf
module "ecs_task_definition" {
  source = "git::https://github.com/nitinda/terraform-module-aws-ecs-task-definition.git?ref=terraform-12/master"

  providers = {
    aws = aws.services
  }

  family = "nginx"
  container_definitions = <<EOF
[
   {
         "Name": "nginx",
         "Image": "nginx",
         "PortMappings": [
            {
               "ContainerPort": 80,
               "Protocol": "tcp",
               "HostPort": 8080
            }
         ],
         "MemoryReservation": 12,
         "Memory": 64,
         "Essential": true
    }
]
EOF

  memory = 512
  cpu    = 256
  network_mode = "bridge"
  requires_compatibilities = ["EC2"]



  # Tags
  tags = {
      Project      = "POC"
      Environment  = "prod"
  }
}
```


---

## _Inputs_

_The variables required in order for the module to be successfully called from the deployment repository are the following:_

|**_Variable_** | **_Description_** | **_Type_** | **_Argument Status_** |
|:----|:----|-----:|:---:|
| **_family_** | _A unique name for your task definition_ | _string_ | **_Required_** |
| **_container\_definitions_** | _A list of valid container definitions <br/> provided as a single valid JSON document_ | _string_ | **_Required_** |
| **_task\_role\_arn_** | _The ARN of IAM role that allows your Amazon ECS <br/> container task to make calls to other AWS services_ | _string_ | **_Optional (Default - null)_** |
| **_execution\_role\_arn_** | _The ARN of the task execution role that the Amazon ECS <br/> container agent and the Docker daemon can assume_ | _string_ | **_Optional <br/> (Default - null)_** |
| **_network\_mode_** | _The Docker networking mode to use <br/> for the containers in the task_ | _string_ | **_Optional <br/> (Default - null)_** |
| **_ipc\_mode_** | _The IPC resource namespace to be <br/> used for the containers in the task_ | _string_ | **_Optional <br/> (Default - null)_** |
| **_pid\_mode_** | _The process namespace to use for <br/> the containers in the task_ | _string_ | **_Optional <br/> (Default - null)_** |
| **_volume_** | _A set of volume blocks that <br/> containers in your task may use_ | _any_ | **_Optional <br/> (Default - {})_** |
| **_placement\_constraints_** | _A set of placement constraints rules that <br/> are taken into consideration during task placement_ | _any_ |  **_Optional (Default - [])_** |
| **_cpu_** | _The number of cpu units used by the task_ | _string_ | **_Optional <br/> (Default - null)_** |
| **_memory_** | _The amount (in MiB) of memory used by the task_ | _string_ | **_Optional <br/> (Default - null)_** |
| **_requires\_compatibilities_** | _A set of launch types_ | _list(string)_ | **_Optional <br/> (Default - {})_** |
| **_tags_** | _Resource tags_ | _map(string)_ | **_Required_** |


---


## _Outputs_

### _General_

_This module has the following outputs:_


* **_arn_**
* **_family_**
* **_revision_**


### _Usage_

_In order for the variables to be accessed at module level please use the syntax below:_


```tf
data.terraform_remote_state.<layer_name>.<output_variable_name>
```
---



## _Authors_

_Module maintained by Module maintained by the -_ **_Nitin Das_**
