variable "bucket_name" {
  type        = string
  description = "Name for the bucket."
  nullable    = false
}

variable "content_path" {
  type        = string
  description = "Specifies the path to the directory containing files for the bucket. Set to null to avoid uploading any files to the bucket."
  default     = null
}
