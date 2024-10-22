variable region {
  type        = string
  default     = "us-east-2"  
}

variable key_name {
  type        = string
  default     = "homework"
}
variable ami_id {
  type        = string
  default     = "ami-050cd642fd83388e4"
}
variable ports {
  type        = list
  default     = [22, 80, 443]
}
variable availability_zone {
  type        = string
  default     = "us-east-2a"
}

variable instance_type {
  type        = string
  default     = "t2.micro"
}

variable instance_count {
  type        = number
  default     = 2
}
