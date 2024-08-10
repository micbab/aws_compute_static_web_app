variable "cidr" {
  type        = string
  description = "CIDR block for the VPC."
  nullable    = false
}

variable "vpc_name" {
  type        = string
  description = "Name for the VPC."
  # Setting a VPC name is not required, but it is good practice to do so. Therefore, nullable is set to false.
  nullable = false
}
