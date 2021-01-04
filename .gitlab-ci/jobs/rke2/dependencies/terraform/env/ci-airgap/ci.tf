terraform {
  backend "s3" {
    bucket               = "umbrella-tf-states"
    key                  = "terraform.tfstate"
    region               = "us-gov-west-1"
    dynamodb_table       = "umbrella-tf-states-lock"
    workspace_key_prefix = "rke2"
  }
}

data "terraform_remote_state" "networking" {
  backend = "s3"
  config = {
    bucket               = "umbrella-tf-states"
    key                  = "terraform.tfstate"
    region               = "us-gov-west-1"
    workspace_key_prefix = "aws-networking"
  }
  workspace = var.env
}

data "aws_vpc" "selected" {
  id = data.terraform_remote_state.networking.outputs.vpc_id
}


data "terraform_remote_state" "utility" {
  backend = "s3"
  config = {
    bucket               = "umbrella-tf-states"
    key                  = "terraform.tfstate"
    region               = "us-gov-west-1"
    workspace_key_prefix = "utility"
  }
  workspace = var.env
}

data "template_file" "pre_userdata" {
  template = file("${path.module}/pre_userdata.tpl")
  vars = {
     registry_username = data.terraform_remote_state.utility.outputs.utility_username
     registry_password = data.terraform_remote_state.utility.outputs.utility_password
     cidr_block   = data.aws_vpc.selected.cidr_block
  }
}

module "ci" {
  source = "../../main"

  env               = var.env
  vpc_id            = data.terraform_remote_state.networking.outputs.vpc_id
  deploy_subnets    = data.terraform_remote_state.networking.outputs.private_subnets
  public_subnets    = data.terraform_remote_state.networking.outputs.public_subnets
  pre_userdata      = data.template_file.pre_userdata.rendered
}