variable "s3_buckets" {
  type        = map(string)
  description = "Map of S3 buckets, where the key is the bucket name and the value is the path to its content."
  nullable    = false
}

variable "vpcs" {
  type        = map(string)
  description = "Map of VPCs, where the key is the VPC name and the value is the CIDR block."
  nullable    = false
}
variable "private_subnets" {
  type = map(object({
    vpc_name          = string
    subnet_zone       = string
    nat_public_subnet = string
    eip_name          = string
    route_table_name  = string
    private_subnets   = map(string)
  }))
  description = "Map of private subnets with their associated VPC name, CIDR block, and subnet zone."
  nullable    = false
}

variable "public_subnets" {
  type = map(object({
    public_subnets = map(object({
      cidr = string
      zone = string
    }))
    internet_gateway_name = string
    route_table_name      = string
  }))
  description = "Object of public subnets definitions including CIDR, availability zone, Internet Gateway, and Route Table."
  nullable    = false
}
