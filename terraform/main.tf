provider "aws" {
 region = "ap-south-1"
}

resource "aws_instance" "devops_server" {

 ami           = "ami-0f5ee92e2d63afc18"
 instance_type = "t2.micro"

 user_data = <<-EOF
              #!/bin/bash
              yum install docker -y
              service docker start
              docker run -d -p 80:5000 mruganimule/devops-flask-app
              EOF

 tags = {
   Name = "DevOpsServer"
 }
}
