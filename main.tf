module "s3_web_app" {
  source = "./modules/s3_bucket"

  for_each = var.s3_buckets

  bucket_name  = each.key
  content_path = each.value
}

module "vpc" {
  source = "./modules/vpc"

  for_each = var.vpcs

  vpc_name = each.key
  cidr     = each.value
}

module "private_subnets_with_internet_access" {
  source = "./modules/private_subnets_with_internet_access"

  for_each = var.private_subnets

  vpc_id           = module.vpc[each.value.vpc_name].vpc_id
  subnet_zone      = each.value.subnet_zone
  subnet_id        = module.public_subnets[each.value.vpc_name].subnet_ids[each.value.nat_public_subnet]
  eip_name         = each.value.eip_name
  route_table_name = each.value.route_table_name
  nat_gateway_name = each.key
  private_subnets  = each.value.private_subnets
}

module "public_subnets" {
  source = "./modules/public_subnets"

  for_each = var.public_subnets

  vpc_id         = module.vpc[each.key].vpc_id
  public_subnets = each.value.public_subnets

  internet_gateway_name = each.value.internet_gateway_name
  route_table_name      = each.value.route_table_name

}
