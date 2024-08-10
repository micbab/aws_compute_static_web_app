variable "vpc_id" {
  type        = string
  description = "ID of the VPC where the subnets will be created."
  nullable    = false
}

variable "public_subnets" {
  type = map(object({
    cidr = string
    zone = string
  }))
  description = "Map of subnets, where each key is a subnet identifier and each value is an object containing the CIDR block and the availability zone for the subnet."
  nullable    = false
}

variable "internet_gateway_name" {
  type        = string
  description = "Name for the Internet Gateway."
  nullable    = false
}

variable "route_table_name" {
  type        = string
  description = "Name for the Route Table."
  nullable    = false
}
