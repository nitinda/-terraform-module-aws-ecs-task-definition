Terraform Module:  terraform-module-aws-ecs-task-definition


## General

This module can be used to deploy a ECS task definition.


---

## Prerequisites

This module needs Terraform 0.11.10 or newer.
You can download the latest Terraform version from [here](https://www.terraform.io/downloads.html).



---


## Features

This module deploys ECS task definition, so will need to have a pre-existing vpc configured.

- *ECS Task Definition*


---

## Usage

## Using this repo

To use this module, add the following call to your code:

```tf
module "<layer>-ecs-task-definition-<AccountID>" {
  source = "../../modules/uki-shared-services-terraform-module-ecs-task-definition"

  # Pass in relevant inputs required for this module here
  # e.g. vpc_id = "${data.terraform_remote_state.networking_shared_services.vpc_id}"

}
```


---

## Inputs

The variables required in order for the module to be successfully called from the deployment repository are the following:

| Variable                      | Description                                   | Type            |
|-------------------------------|-----------------------------------------------|-----------------|
| common_tags                   | Resource tags                                 | map             |
| family                        | A unique name                                 | string          |
| container_definitions         | A list of valid container definitions         | string          |
| task_role_arn                 | The ARN of IAM role for container task        | string          |
| execution_role_arn            | The Amazon Resource Name                      | string          |
| network_mode                  | The Docker networking mode                    | string          |
| volume                        | A set of volume blocks                        | list of maps    |
| placement_constraints         | A set of placement constraints rules          | list of maps    |
| cpu                           | The number of cpu units                       | string          |
| memory                        | The amount (in MiB) of memory                 | string          |
| requires_compatibilities      | A set of launch types                         | string          |




---


## Outputs

### General
This module has the following outputs:


* *arn*
* *family*
* *revision*



### Usage
In order for the variables to be accessed at module level please use the syntax below:


```tf
module.<module_name>.<output_variable_name>

```

If an output variable needs to be exposed on root level in order to be accessed through terraform state file follow the steps below:

- Include the syntax above in the layer outputs.tf terraform file.
- Add the code snippet below to the variables/global_variables file.

```tf
data "terraform_remote_state" "<layer_name>" (i.e. "iam_roles_layer") {
  backend = "s3"

  config {
    bucket = <bucket_name> (i.e. "uki-s3-global-terraform-state")
    key    = <state_file_relative_path> (i.e. "env:/Global/2_IAM_Roles/terraform.tfstate")
    region = <bucket_region> (i.e. "eu-central-1")
  }
}
```

- The output variable is able to be accessed through terraform state file using the syntax below:


```tf
"${data.terraform_remote_state.<layer_name>.<output_variable_name>}"
```
---


### Known Issues / Limitations

- *None*


### Planned changes
 
- *None*


---

## Authors

Module maintained by Module maintained by the - Nitin Das
