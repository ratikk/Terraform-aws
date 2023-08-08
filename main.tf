# Virtual Private Cloud (VPC) Configuration

module "spoke1-vpc" {
    source = "./modules/security/vpc"
    vpc_cidr = var.tiers_config.vpc.cidr
    cidr_block = var.tiers_config.vpc.cidr_block
    availability_zones = var.tiers_config.vpc.availability_zones
    tags = {
        vpc = {
            Environment = var.tiers_config.environment
        }
        subnet1 = {    
            Environment = var.tiers_config.environment       
        }
        subnet2 = {       
            Environment = var.tiers_config.environment     
        }
        subnet3 = {     
            Environment = var.tiers_config.environment      
        }
        subnet4 = {    
            Environment = var.tiers_config.environment        
        }                
    }
}

# AWS Security Groups - For Batch Servers
module "sg01" {
    source = "./modules/security/security-groups"
    depends_on = [module.spoke1-vpc]

    name_prefix       = var.tiers_config.security_groups.batch.name_prefix
    vpc_id_1         = module.spoke1-vpc.vpc_id
}

# AWS Security Groups - For CDB 1 2 3 Servers
module "sg02" {
    source = "./modules/security/security-groups"
    depends_on = [module.spoke1-vpc]

    name_prefix       = var.tiers_config.security_groups.db.name_prefix
    vpc_id_1         = module.spoke1-vpc.vpc_id
}

# Batch Server EC2
module "batch_ec2" {
    source = "./modules/ec2"
    count = length(var.tiers_config.batch_ec2)
    depends_on = [ module.spoke1-vpc, module.sg01, module.sg02 ]

    ami_id = lookup(var.rhel_ami[var.tiers_config.batch_ec2[count.index].ami_lookup], replace(var.tiers_config.region, "-", "_"))
    name = "${var.agency_code}${var.pcm_seprator}${var.category}${var.ec2type}${var.tiers_config.batch_ec2[count.index].application}_${var.tiers_config.batch_ec2[count.index].name_suffix}"
    instance_type = var.tiers_config.batch_ec2[count.index].instance_type
    vpc_security_group_ids = [module.sg01.security_group_id]
    subnet_id = element(module.spoke1-vpc.subnet_order[*].id, var.tiers_config.batch_ec2[count.index].subnet_id)
    volume_size_1 = var.tiers_config.batch_ec2[count.index].volume_size_1
    volume_name_2 = var.tiers_config.batch_ec2[count.index].volume_name_2
    volume_size_2 = var.tiers_config.batch_ec2[count.index].volume_size_2
    tags = {
    }
}

# DB Server EC2
module "db_ec2" {
    source = "./modules/ec2"
    count = length(var.tiers_config.db_ec2)
    depends_on = [ module.spoke1-vpc, module.sg01, module.sg02 ]

    ami_id = lookup(var.rhel_ami[var.tiers_config.db_ec2[count.index].ami_lookup], replace(var.tiers_config.region, "-", "_"))
    name = "${var.agency_code}${var.pcm_seprator}${var.category}${var.ec2type}${var.tiers_config.db_ec2[count.index].application}_${var.tiers_config.db_ec2[count.index].name_suffix}"
    instance_type = var.tiers_config.db_ec2[count.index].instance_type
    vpc_security_group_ids = [module.sg01.security_group_id]
    subnet_id = element(module.spoke1-vpc.subnet_order[*].id, var.tiers_config.db_ec2[count.index].subnet_id)
    volume_size_1 = var.tiers_config.db_ec2[count.index].volume_size_1
    volume_name_2 = var.tiers_config.db_ec2[count.index].volume_name_2
    volume_size_2 = var.tiers_config.db_ec2[count.index].volume_size_2
    ebs_block_devices = var.tiers_config.db_ec2[count.index].ebs_block_devices
    tags = {
    }
}