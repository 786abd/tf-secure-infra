# data "aws_ami" "amazon_linux" {
#   most_recent = true
#   owners      = ["amazon"]

#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-*"]
#   }
# }

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
  owners = ["099720109477"] # Canonical 
}

module "vpc" {
  source              = "../modules/vpc"
  cidr_block          = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  region              = var.region
}

module "sg" {
  source  = "../modules/sg"
  vpc_id  = module.vpc.vpc_id
  sg_name = "app-security-group"
  ingress_ports = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

module "ec2" {
  source             = "../modules/ec2"
  ami                = data.aws_ami.ubuntu.id
  instance_type      = var.instance_type
  subnet_id          = module.vpc.private_subnet
  security_group_ids = [module.sg.sg_id]
}

# module "bastion" {
#   source = "./modules/ec2"
#   ami = data.aws_ami.ubuntu.id
#   instance_type = var.instance_type
#   subnet_id = module.vpc.public_subnet
#   security_group_ids = [module.sg.sg_id]
# }