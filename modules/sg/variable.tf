variable "sg_name" {
  
}

variable "vpc_id" {
  
}

variable "ingress_ports" {
  type = list(object
  ({
    from_port = number
    to_port = number
    protocol = string
    cidr_blocks = list(string)
  }))
}
  