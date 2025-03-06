# OUTPUT
output "aws_instance_public_dns" {
  value = aws_instance.aws_ubuntu.public_dns
}
output "ec2_instance_id" {
  value = aws_instance.aws_ubuntu.id
}
output "aws_instance_private_ip" {
  value = aws_instance.aws_ubuntu.private_ip
}
output "aws_instance_public_ip" {
  value = aws_instance.aws_ubuntu.public_ip
}

output "aws_instance_key_name" {
  value = aws_instance.aws_ubuntu.key_name
}
output "aws_instance_security_groups" {
  value = aws_instance.aws_ubuntu.security_groups
}
output "aws_instance_subnet_id" {
  value = aws_instance.aws_ubuntu.subnet_id
}
output "aws_instance_vpc_security_group_ids" {
  value = aws_instance.aws_ubuntu.vpc_security_group_ids
}
output "aws_instance_tags" {
  value = aws_instance.aws_ubuntu.tags
}
output "aws_instance_instance_type" {
  value = aws_instance.aws_ubuntu.instance_type
}
output "aws_instance_availability_zone" {
  value = aws_instance.aws_ubuntu.availability_zone
}

