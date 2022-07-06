resource "aws_instance" "sonar" {
#ami = "ami-00068cd7555f543d5"
### Below ami is Redhat instance
ami = "ami-06640050dc3f556bb"
instance_type = "t2.medium"
security_groups = ["${aws_security_group.sonar-node.name}"]
key_name = "june"
# Copy in the bash script we want to execute.
  # The source is the location of the bash script
  # on the local linux box you are executing terraform
  # from.  The destination is on the new AWS instance.
  provisioner "file" {
    source      = "package.sh"
    destination = "/tmp/package.sh"
  }
  # Change permissions on bash script and execute from ec2-user.
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/package.sh",
      "sudo /tmp/package.sh",
    ]
  }
  
  # Login to the ec2-user with the aws key.
  connection {
    type        = "ssh"
    user        = "ec2-user"
    password    = ""
    private_key = file("june.pem")
    host        = self.public_ip
  }
tags = {
Name = "sonarcube"
}
}
