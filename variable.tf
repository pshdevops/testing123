variable "project_name" {
  type        = string
  description = "Project name"
  default     = "dpa"
}

variable "env" {
  type        = string
  description = "sandbox"
  default     = "sandbox"
}


variable "confidentality" {
  type        = string
  description = "confidentality"
  default     = "public"
}

variable "compliance" {
  type        = string
  description = "sandbox"
  default     = "none"
}
variable "cost_center" {
  type        = string
  description = "sandbox"
  default     = "6000909"
}

variable "owner" {
  type        = string
  description = "sandbox"
  default     = "data"
}
variable "account_name" {
  type        = string
  description = "data-analysis-team"
  default     = "s_test_user"
}

variable "admin_username" {
  type        = string
  default     = "practice_user"
  description = "admin usernam"
}

variable "domain" {
  type        = string
  description = "domain"
  default     = "data"
}

variable "user_arn" {
  default = "arn:aws:iam::047109936880:user/khong-aol"
}

variable "key_spec" {
  default = "SYMMETRIC_DEFAULT"
}

variable "enabled" {
  default = true
}

variable "rotation_enabled" {
  default = true
}

variable "admin_rolename" {
  default = "s3_admin_role"
}

variable "access_key" {
  default = ""
}

variable "secret_key" {
  default = ""
}