variable "vpc_id" {
  type        = string
  description = "ID of the VPC where the subnets will be created."
  nullable    = false
}

variable "subnet_zone" {
  type        = string
  description = "Availability zone for the subnet."
  nullable    = false
}

variable "route_table_id" {
  type        = string
  description = "Route table ID to attach to the private subnet."
  default     = null
}

variable "subnet_id" {
  description = "ID of the subnet in which to place the NAT Gateway."
  type        = string
  nullable    = false
}

variable "eip_name" {
  description = "Name for the Elastic IP."
  type        = string
  nullable    = false
}

variable "route_table_name" {
  description = "Name for the Route Table."
  type        = string
  nullable    = false
}

variable "nat_gateway_name" {
  description = "Name for the NAT Gateway."
  type        = string
  nullable    = false
}

variable "private_subnets" {
  description = "A map of subnet names and their CIDR values."
  type        = map(string)
  nullable    = false
}
