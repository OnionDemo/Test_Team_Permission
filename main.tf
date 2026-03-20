terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = ">= 0.74.1"
    }
  }
}

provider "tfe" {
  hostname = "app.terraform.io"
}

variable "organization_name" {
  description = "Name of your HCP Terraform organization"
  type        = string
}

variable "team_name" {
  description = "Name of the team to create"
  type        = string
}

resource "tfe_team" "example" {
  name         = var.team_name
  organization = var.organization_name

  #Used by Owners and users with "Manage Teams" permissions to control whether team members can manage team tokens. 
  #Defaults to true. Set to false to test if we can creat team token.
  allow_member_token_management = false 

  #set this to true, to test what will show in the HCP Terraform UI
  manage_teams = true
  visibility = "organization"
}
