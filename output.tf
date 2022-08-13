output "instance_id"{
    description = "The ec2 instance id"
    value       = aws_instance.terraform_demo.id    
}

output "instance_arn"{
    description = "The arn of the Instance"
    value       =  aws_instance.terraform_demo.arn  
}
output "instance_zone" {
    description = "The instance launched zone"
    value = aws_instance.terraform_demo.availability_zone
}
output "instance_ip" {
    description = "The instance ip address"
    value = aws_instance.terraform_demo.private_ip
}