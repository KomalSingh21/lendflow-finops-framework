terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = merge(var.tags, {
    Name = var.name
  })

  lifecycle {
    precondition {
      condition     = var.tags["environment"] == var.environment
      error_message = "Resource environment and environment tag must match."
    }

    precondition {
      condition = var.environment == "production" || !contains(
        ["m7i.4xlarge", "m7i.8xlarge", "c7i.4xlarge", "r7i.4xlarge"],
        var.instance_type
      )
      error_message = "Oversized instance types are not permitted outside production."
    }
  }
}

output "instance_id" {
  value = aws_instance.this.id
}
