variable "aws_region" {
  default = "us-east-1"
  type = string
}

variable "environment" {
  description = "Environment Variable used as a prefix"
  type = string
  default = "dev"
}

variable "business_divsion" {
  description = "Business Division in the large organization this Infrastructure belongs"
  type = string
  default = "SAP"
}
