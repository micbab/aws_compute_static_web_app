module "s3_web_app" {
  source = "./modules/s3_bucket"

  for_each = var.s3_buckets

  bucket_name  = each.key
  content_path = each.value
}
