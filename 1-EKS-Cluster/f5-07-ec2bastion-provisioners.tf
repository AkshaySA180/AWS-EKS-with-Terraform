resource "null_resource" "name" {
    connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("private-key/terraform-key.pem")
    host     = aws_eip.bastion_eip.public_ip
  }  

  provisioner "file" {
    source = "private-key/terraform-key.pem"
    destination = "/tmp/terraform-key.pem"
  }

  provisioner "remote-exec" {
    inline = ["sudo chmod 400 /tmp/terraform-key.pem"]
  }

}