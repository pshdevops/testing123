variable "account_id" {
  type        = string
  description = ""
  default     = "backstage-test4"
}

variable "user_access" {
  type        = string
  description = "user access"
  default     = "readOnly"
}


variable "s3_folders" {
  type        = list(string)
  description = "s3 folders"
  default     =  [ "bucket-london4","bucket-heathrow4" ]
}
