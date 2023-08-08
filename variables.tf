variable "agency_code" {
    type = string
    description = "Agency code used for naming convention by PCM"
}

variable "pcm_seprator" {
    type = string
    description = "Seprator character used for naming convention by PCM"
}

variable "category" {
    type = string
    description = "Category used for naming convention by PCM. W = AWS"
}

variable "ec2type" {
    type = string
    default = "V"
    description = "Type of EC2, V for Virtualized, used for naming convention by PCM"
}

variable "rhel_ami" {
    type = object({
        x86 = map(string)
    })
}

variable "tiers_config" {
    type = object({
        environment = string
        region = string
        vpc = object({
            cidr = string
            cidr_block = map(string)
            availability_zones = map(string)
        })
        security_groups = object({
            db = object({
                name_prefix = string
            })
            batch = object({
                name_prefix = string
            })
        })
        batch_ec2 = list(object({
            application = string
            name_suffix = string
            ami_lookup = string
            instance_type = string
            volume_size_1 = string
            volume_name_2 = string
            volume_size_2 = string
            subnet_id = number
            ebs_block_devices = optional(list(object({
                device_name = string
                volume_size = number
                volume_type = string
                iops = number
            })))
        })) 
        db_ec2 = list(object({
            application = string
            name_suffix = string
            ami_lookup = string
            instance_type = string
            volume_size_1 = string
            volume_name_2 = string
            volume_size_2 = string
            subnet_id = number
            ebs_block_devices = optional(list(object({
                device_name = string
                volume_size = number
                volume_type = string
                iops = number
            })))
        })) 
    })
    description = "TIERS Configuration"
}