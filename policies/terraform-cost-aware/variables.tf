variable "name" {
  type        = string
  description = "Workload name."
  validation {
    condition     = can(regex("^[a-z0-9-]{3,32}$", var.name))
    error_message = "name must be 3-32 characters using lowercase letters, numbers, and hyphens."
  }
}

variable "environment" {
  type        = string
  description = "Deployment environment."
  validation {
    condition     = contains(["dev", "staging", "production"], var.environment)
    error_message = "environment must be dev, staging, or production."
  }
}

variable "tags" {
  type        = map(string)
  description = "Mandatory FinOps tags plus optional metadata."

  validation {
    condition = alltrue([
      for k in ["business_unit", "product", "environment", "cost_centre", "team"] :
      contains(keys(var.tags), k) && trim(var.tags[k], " ") != ""
    ])
    error_message = "Mandatory tags are business_unit, product, environment, cost_centre, and team."
  }

  validation {
    condition     = var.tags["environment"] == var.environment
    error_message = "tags.environment must match the environment variable."
  }
}

variable "instance_type" {
  type        = string
  description = "Approved EC2 instance type."

  validation {
    condition = contains([
      "t3.medium", "t3.large", "m7i.large", "m7i.xlarge",
      "c7i.large", "c7i.xlarge", "r7i.large", "r7i.xlarge"
    ], var.instance_type)
    error_message = "instance_type is not on the LendFlow approved instance list."
  }

  validation {
    condition = var.environment == "production" || !contains([
      "m7i.4xlarge", "m7i.8xlarge", "c7i.4xlarge", "r7i.4xlarge"
    ], var.instance_type)
    error_message = "Oversized instance types are blocked outside production."
  }
}

variable "ami_id" {
  type        = string
  description = "AMI ID."
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID."
}

variable "cost_threshold_monthly_usd" {
  type        = number
  default     = 500
  description = "Maximum allowed monthly estimated cost for the module."
  validation {
    condition     = var.cost_threshold_monthly_usd > 0
    error_message = "cost_threshold_monthly_usd must be greater than zero."
  }
}
