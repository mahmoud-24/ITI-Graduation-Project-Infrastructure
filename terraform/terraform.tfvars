region      = "us-east4"
project_id  = "mahmoud-ibrahim-2023"
zone        = "us-east4-b"
image       = "ubuntu-os-cloud/ubuntu-2204-lts"
vpc-name    = "vpc-1"
subnet-name = "management-subnet"
subnet-cidr = "10.0.1.0/24"
credentials = "./mahmoud-ibrahim-2023-bb473c8a0c13.json"

iam-role    =[ "resourcemanager.projects.get" , "container.deployments.get" , "container.deployments.create" , "container.deployments.list" , "container.services.list" , "container.services.get" ,
    "container.services.create" , "container.clusters.list" , "container.clusters.getCredentials" , "container.clusters.get" , "container.pods.list" , "container.nodes.list" ]