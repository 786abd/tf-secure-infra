variable "instance_type" {
  default = "t2.micro" 
}

variable "ami" {
    default = "ami-01869976fefca2ce5"
}

variable "security_group_ids" {
  type = list(string)
  
}

variable "subnet_id" {
  
}