provider "aws" {
    region = "eu-central-1"
}

module "network" {
    source = "modules/network"

    app_name                = "${var.app_name}"
    vpc_cidr                = "${var.vpc_cidr}"
    public_subnet_cidrs     = "${var.public_subnet_cidrs}"
    private_subnet_cidrs    = "${var.private_subnet_cidrs}"
    availibility_zones      = "${var.availibility_zones}"
}

module "ec2" {
    source = "modules/ec2"
    
    app_name                = "${var.app_name}"
}

variable "vpc_cidr" {}

variable "app_name" {}

variable "private_subnet_cidrs" {
  type = "list"
}

variable "public_subnet_cidrs" {
  type = "list"
}

variable "availibility_zones" {
  type = "list"
}
