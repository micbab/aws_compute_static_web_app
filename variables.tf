variable "s3_buckets" {
  type        = map(string)
  description = "Map of S3 bucket, when key is name of the bucket and value is path to the bucket content"
  nullable    = false
}
