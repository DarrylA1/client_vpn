variable "project_name" {
  type        = string
  description = "The prefix name of the project"
}

variable "region_name" {
  type        = string
  description = "The name of the region"
}

variable "s3_backend_bucket_name" {
  type        = string
  description = "The name of the s3 bucket for terraform"
}

variable "vpc_id" {
  type        = string
  description = "The id of the vpc for the account"
}