provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
 ami = "ami-08d7f96ac4c7efbfa"
 instance_type = "t2.micro"
 key_name = "ASIA-Mumbai-pem"

 user_data = <<-EOF
 
 
EOF
}