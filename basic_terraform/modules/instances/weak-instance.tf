# provide an option to enable this module
# if the variable "enabled" is true create a simple ec2 instance

resource "aws_instance" "weak-example" {
  count = var.weak_enabled ? 1 : 0
  ami           = "ami-06ca3ca175f37dd66"
  instance_type = "t2.micro"
  vpc_security_group_ids = [var.remote_exec_sgs]
  subnet_id = var.remote_exec_subnet

  associate_public_ip_address = true

  tags = {
      Name = "r2dso-lab-instance-weak"
      Vulnerable = "true"
  }

  #iam_instance_profile = "tf-testing-role"

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(var.priv_key)
    host        = self.public_ip
    agent       = false
  }

  key_name = var.key_name

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "optional"
    http_put_response_hop_limit = 10
  }

}

output "public_ip_weak_instance" {
  value = aws_instance.weak-example[0].public_ip
}

output "weak_instance_id" {
  value = aws_instance.weak-example[0].id
}