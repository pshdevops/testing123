variable "user_access" {
  type        = string
  description = "user access"
  default     = "readOnly"
}

variable "s3_folders" {
  type        = list(string)
  description = "s3 folders"
  default     =  [
    "bucket1",
    "bucket2",
  ]
}

variable "dpa_bucket_name" {
  type = string
  default     = "harsha-dpa123456778"
}
