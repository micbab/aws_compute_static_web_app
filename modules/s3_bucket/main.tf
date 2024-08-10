resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_object" "object" {
  # If the content path is null, then no objects are created; otherwise, the directory content is iterated through.
  for_each = var.content_path != null ? fileset(var.content_path, "**") : toset([])

  bucket = aws_s3_bucket.bucket.id
  key    = each.value
  source = "${var.content_path}/${each.value}"
  etag   = filemd5("${var.content_path}/${each.value}")
}
