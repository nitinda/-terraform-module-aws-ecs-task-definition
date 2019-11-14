Terraform Module:  terraform-module-aws-ecs-task-definition


## General

This module can be used to deploy a ECS task definition.


---

## Prerequisites

This module needs Terraform 0.11.10 or newer.
You can download the latest Terraform version from [here](https://www.terraform.io/downloads.html).


This module deploys aws services details are in respective feature branches.

---

## Features Branches

Below we are able to check the resources that are being created as part of this module call:

From branch : *terrform-11*

- *ECS Task Definition (Terraform 11 supported code)*

From branch : *terrform-12* *[Work in progress]*

- *ECS Task Definition (Terraform 12 supported code - Work in progres)*


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

- *Details are in respective branch.*


---


## Outputs

### General
This module has the following outputs:


- *Details are in respective branch.*



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
