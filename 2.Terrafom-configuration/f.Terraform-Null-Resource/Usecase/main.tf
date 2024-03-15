# Use Case 1 - null_resource with local provisioner

# 1. Run multiple commands- The local-exec provisioner is not limited to running single command but instead, you can run multiple commands within local-exec provisioner using the null_resource.

resource "null_resource" "null_resource_simple" {
  
  triggers = {
    id = aws_instance.ec2_example.id  
  }
  provisioner "local-exec" {
    command = <<-EOT
      chmod +x install-istio.sh  
      ./install-istio.sh
    EOT
  }
}


# 2. Create a file- As you know local-exec provisioner gives you the liberty to execute shell commands, so you can pretty much do everything possible with your terminal. For example, you can create the file 

 resource "null_resource" "null_resource_simple" {

  triggers = {
    id = aws_instance.ec2_example.id
  }
  provisioner "local-exec" {
    command = <<-EOT
      touch hello-world.txt
    EOT
  }
}


