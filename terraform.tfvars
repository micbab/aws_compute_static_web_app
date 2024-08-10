s3_buckets = {
  aws-compute-static-web-app = "web_app"
}

vpcs = {
  aws-compute-static-web-app-vpc = "10.0.0.0/18"
}

private_subnets = {
  "aws-compute-static-web-app-nat-gateway-01" = {
    private_subnets = {
      "aws-compute-static-web-app-private-subnet-01" = "10.0.12.0/22"
    }
    vpc_name          = "aws-compute-static-web-app-vpc"
    subnet_zone       = "eu-north-1a"
    nat_public_subnet = "aws-compute-static-web-app-public-subnet-01"
    eip_name          = "aws-compute-static-web-app-eip"
    route_table_name  = "aws-compute-static-web-app-private-route-table"
  }
  "aws-compute-static-web-app-nat-gateway-02" = {
    private_subnets = {
      "aws-compute-static-web-app-private-subnet-02" = "10.0.16.0/22"
    }
    vpc_name          = "aws-compute-static-web-app-vpc"
    subnet_zone       = "eu-north-1b"
    nat_public_subnet = "aws-compute-static-web-app-public-subnet-02"
    eip_name          = "aws-compute-static-web-app-eip"
    route_table_name  = "aws-compute-static-web-app-private-route-table"
  }
  "aws-compute-static-web-app-nat-gateway-03" = {
    private_subnets = {
      "aws-compute-static-web-app-private-subnet-03" = "10.0.20.0/22"
    }
    vpc_name          = "aws-compute-static-web-app-vpc"
    subnet_zone       = "eu-north-1c"
    nat_public_subnet = "aws-compute-static-web-app-public-subnet-03"
    eip_name          = "aws-compute-static-web-app-eip"
    route_table_name  = "aws-compute-static-web-app-private-route-table"
  }
}

public_subnets = {
  "aws-compute-static-web-app-vpc" = {
    public_subnets = {
      aws-compute-static-web-app-public-subnet-01 = {
        cidr = "10.0.0.0/27"
        zone = "eu-north-1a"
      }
      aws-compute-static-web-app-public-subnet-02 = {
        cidr = "10.0.0.32/27"
        zone = "eu-north-1b"
      }
      aws-compute-static-web-app-public-subnet-03 = {
        cidr = "10.0.0.64/27"
        zone = "eu-north-1c"
      }
    }

    internet_gateway_name = "aws-compute-static-web-app-internet-gateway"
    route_table_name      = "aws-compute-static-web-app-public-route-table"
  }
}
