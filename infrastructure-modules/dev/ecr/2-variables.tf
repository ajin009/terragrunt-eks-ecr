variable "repository_name" {
  description = "Name of the repository."
  type        = string
}

variable "image_tag_mutability" {
  description = "The tag mutability setting for the repository."
  type        = string
  default     = "MUTABLE"
}

variable "scan_on_push" {
  description = "Indicates whether images are scanned after being pushed to the repository."
  type        = bool
  default     = true
}

variable "lifecycle_policy" {
  description = "The lifecycle policy for the repository."
  type        = string
  default     = ""
}