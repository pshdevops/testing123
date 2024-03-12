variable "account_id" {
  type        = string
  description = ""
  default     = "123456"
}

variable "user_access" {
  type        = string
  description = "user access"
  default     = "readOnly"
}


variable "s3_folders" {
  type        = list(string)
  description = "s3 folders"
  default     = ${ JSON.stringify(values.s3_folders) }
}
