variable "ami_id" {
  description = "The ID of the desired AMI for RHEL 8.6."
}

variable "name" {
  description = "EC2 instance name"
}

variable "instance_type" {
  description = "The desired instance type."
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with the EC2 instance."
#  type        = set(string)  # Change the type to set of strings
}

variable "subnet_id" {
  description = "The subnet ID where the EC2 instance will be launched."
}

variable "ebs_block_devices" {
  description = "List of EBS block devices for the EC2 instance"
  type        = list(object({
    device_name = string
    volume_size = number
    volume_type = string
    iops        = number
  }))
  default     = null
}

variable "volume_size_1" {
  description = "This is Volume Size for default boot volume. RHEL Snapshot is installed here"
}

variable "volume_name_2" {
  description = "This is Volume name for additional mount volume."
}

variable "volume_size_2" {
  description = "This is Volume Size for additional mount volume."
}

variable "tags" {
  description = "EC2 Tags"
}
