variable "region" {
    default     = "us-east4"
    type        = string
    description = "The region"
}

variable "project_id" {
  type        = string
  description = "The ID of my project"
}

variable "zone" {
  type        = string
  description = "The primary zone"
}

variable "image" {
  type        = string
  description = "The OS image"
}

variable "service_account" {
  type        = string
  description = "The GCP service account"
}

variable "iam-role" {
    type    = list
}

variable "vpc-name" {
    type    = string
}

variable "subnet-name" {
    type    = string
}

variable "subnet-id" {
    type    = string
}

variable "vpc-id" {
    type    = string
}

variable "email" {
    type    = string
}

variable "subnet-cidr" {
    type    = string
}

variable "credentials" {
    type    = string
}