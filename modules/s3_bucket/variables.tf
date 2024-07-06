variable "bucket_name" {
  type        = string
  description = "Name of the bucket"
  nullable    = false
}

variable "content_path" {
  type        = string
  description = "Path to the directory with bucket files. Put null to not send any files to the bucket."
  default     = null
}
