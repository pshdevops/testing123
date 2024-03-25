variable "account_id" {
  type        = string
  description = ""
  default     = "12345678901"
}

variable "user_access" {
  type        = string
  description = "user access"
  default     = "readOnly"
}

variable "s3_folders" {
  type        = list(string)
  description = "s3 folders"
  default     =  [
    "bucket3",
    "bucket4",
  ]
}

variable "dpa_bucket_name" {
  type = string
  default = ""
}