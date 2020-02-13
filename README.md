# _Terraform Module: terraform-module-aws-ecs-task-definition_


## _General_

_This module can be used to deploy a_ _**ECS Task Definition** on AWS Cloud Provider......_


---

## Prerequisites

_This module needs **Terraform 0.11.14** or newer._
_You can download the latest Terraform version from_ [_here_](https://www.terraform.io/downloads.html).



---

## _Features_

_Below we are able to check the resources that are being created as part of this module call:_

- _**ECS Task Definition**_


---

## _Usage_

## _Using this repo_

_To use this module, add the following call to your code:_

```tf
module "ecs_task_definition" {
  source = "git::https://github.com/nitinda/terraform-module-aws-ecs-task-definition.git?ref=terraform-11/master"

}
```


---

## _Inputs_

_The variables required in order for the module to be successfully called from the deployment repository are the following:_

|**_Variable_** | **_Description_** | **_Type_** | **_Argument Status_** |
|:----|:----|-----:|:---:|
| **_tags_** | _Resource tags_ | _map_ | **_Required_** |
| **_family_** | _A unique name_ | _string_ | **_Required_** |
| **_container\_definitions_** | _A list of valid container definitions_ | _string_ | **_Required_** |
| **_task\_role\_arn_** | _The ARN of IAM role for container task_ | _string_ | **_Optional_** |
| **_execution\_role\_arn_** | _The Amazon Resource Name_ | _string_ | **_Optional_** |
| **_network\_mode_** | _The Docker networking mode_ | _string_ | **_Optional_** |
| **_volume_** | _A set of volume blocks_ | _list of maps_ | **_Optional_** |
| **_placement\_constraints_** | _A set of placement constraints rules_ | _list of maps_ |  **_Required_** |
| **_cpu_** | _The number of cpu units_ | _string_ | **_Required_** |
| **_memory_** | _The amount (in MiB) of memory_ | _string_ | **_Required_** |
| **_requires\_compatibilities_** | _A set of launch types_ | _string_ | **_Required_** |



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
"${data.terraform_remote_state.<layer_name>.<output_variable_name>}"
```

---

## _Authors_

_Module maintained by Module maintained by the -_ **_Nitin Das_**
