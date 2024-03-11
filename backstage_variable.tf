variable "account_id" {
  type        = string
  description = ""
  default     = "905418290423"
}

variable "user_access" {
  type        = string
  description = "user access"
  default     = "practice_user"
}


variable "s3_folders" {
  type        = list(string)
  description = "s3 folders"
  default     = ["das/raw/", "das/standardized/"]
}
