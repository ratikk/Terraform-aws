tiers_config = {
    environment = "PROD"
    region = "us-east-2"
    vpc = {
        cidr = "10.51.0.0/16"
        cidr_block = {
            subnet1 = "10.51.1.0/24"
            subnet2 = "10.51.2.0/24"
            subnet3 = "10.51.3.0/24"
            subnet4 = "10.51.4.0/24"
        }
        availability_zones = {
            subnet1 = "us-east-2a"
            subnet2 = "us-east-2a"
            subnet3 = "us-east-2b"
            subnet4 = "us-east-2b"
        }            
    }
    
    security_groups = {
        db = {
            name_prefix = "PROD-DB-SG"
        }
        batch = {
            name_prefix = "PROD-BATCH-SG"
        }
    }

    batch_ec2 = [
        {
            application   = "TIERS_BATCH"
            name_suffix    = "1"
            ami_lookup    = "x86"
            instance_type = "c5a.2xlarge"
            volume_size_1 = "20"
            volume_name_2 = "/dev/sdb"
            volume_size_2 = "100"
            subnet_id = 0
        },
        {
            application   = "TIERS_BATCH"
            name_suffix    = "2"
            ami_lookup    = "x86"
            instance_type = "c5a.2xlarge"
            volume_size_1 = "20"
            volume_name_2 = "/dev/sdb"
            volume_size_2 = "100"
            subnet_id = 2
        }
    ]
    db_ec2 = [
        {
            application   = "TIERS_CDB"
            name_suffix    = "1"
            ami_lookup    = "x86"
            instance_type = "x2iedn.32xlarge"
            volume_size_1 = "20"
            volume_name_2 = "/dev/sdb"
            volume_size_2 = "100"
            subnet_id     = 1
            ebs_block_devices = [
                {
                    device_name = "/dev/sdc"
                    volume_size = 100
                    volume_type = "io2"
                    iops        = 100
                },
                {
                    device_name = "/dev/sdd"
                    volume_size = 100
                    volume_type = "io2"
                    iops        = 100
                },
                {
                    device_name = "/dev/sde"
                    volume_size = 100
                    volume_type = "io2"
                    iops        = 100
                },
                {
                    device_name = "/dev/sdf"
                    volume_size = 100
                    volume_type = "io2"
                    iops        = 100
                },
                {
                    device_name = "/dev/sdg"
                    volume_size = 100
                    volume_type = "io2"
                    iops        = 100
                },
                {
                    device_name = "/dev/sdh"
                    volume_size = 100
                    volume_type = "io2"
                    iops        = 100
                },
                {
                    device_name = "/dev/sdi"
                    volume_size = 100
                    volume_type = "io2"
                    iops        = 100
                },
                {
                    device_name = "/dev/sdj"
                    volume_size = 100
                    volume_type = "io2"
                    iops        = 100
                },
                {
                    device_name = "/dev/sdk"
                    volume_size = 100
                    volume_type = "io2"
                    iops        = 100
                },                
            ]
        },
        {
            application   = "TIERS_CDB"
            name_suffix    = "2"
            ami_lookup    = "x86"
            instance_type = "x2iedn.8xlarge"
            volume_size_1 = "20"
            volume_name_2 = "/dev/sdb"
            volume_size_2 = "100"
            subnet_id     = 1
            ebs_block_devices = [
                {
                    device_name = "/dev/sdc"
                    volume_size = 100
                    volume_type = "io2"
                    iops        = 100
                },
                {
                    device_name = "/dev/sdd"
                    volume_size = 100
                    volume_type = "io2"
                    iops        = 100
                },
                {
                    device_name = "/dev/sde"
                    volume_size = 100
                    volume_type = "io2"
                    iops        = 100
                },
                {
                    device_name = "/dev/sdf"
                    volume_size = 100
                    volume_type = "io2"
                    iops        = 100
                },
                {
                    device_name = "/dev/sdg"
                    volume_size = 100
                    volume_type = "io2"
                    iops        = 100
                },
                {
                    device_name = "/dev/sdh"
                    volume_size = 100
                    volume_type = "io2"
                    iops        = 100
                },
                {
                    device_name = "/dev/sdi"
                    volume_size = 100
                    volume_type = "io2"
                    iops        = 100
                },
                {
                    device_name = "/dev/sdj"
                    volume_size = 100
                    volume_type = "io2"
                    iops        = 100
                },
            ]
        },
        {
            application   = "TIERS_CDB"
            name_suffix    = "3"
            ami_lookup    = "x86"
            instance_type = "x2iedn.32xlarge"
            volume_size_1 = "20"
            volume_name_2 = "/dev/sdb"
            volume_size_2 = "100"
            subnet_id     = 1
            ebs_block_devices = [
                {
                    device_name = "/dev/sdc"
                    volume_size = 100
                    volume_type = "io2"
                    iops        = 100
                },
                {
                    device_name = "/dev/sdd"
                    volume_size = 100
                    volume_type = "io2"
                    iops        = 100
                },
                {
                    device_name = "/dev/sde"
                    volume_size = 100
                    volume_type = "io2"
                    iops        = 100
                },
                {
                    device_name = "/dev/sdf"
                    volume_size = 100
                    volume_type = "io2"
                    iops        = 100
                },
                {
                    device_name = "/dev/sdg"
                    volume_size = 100
                    volume_type = "io2"
                    iops        = 100
                },
                {
                    device_name = "/dev/sdh"
                    volume_size = 100
                    volume_type = "io2"
                    iops        = 100
                },
                {
                    device_name = "/dev/sdi"
                    volume_size = 100
                    volume_type = "io2"
                    iops        = 100
                },
                {
                    device_name = "/dev/sdj"
                    volume_size = 100
                    volume_type = "io2"
                    iops        = 100
                },
                {
                    device_name = "/dev/sdk"
                    volume_size = 100
                    volume_type = "io2"
                    iops        = 100
                },                
            ]
        },
    ]
}
