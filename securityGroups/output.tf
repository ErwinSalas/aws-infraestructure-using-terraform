output "bastion_sg" {
  value = aws_security_group.bastion_sg
}
output "public_sg" {
  value = aws_security_group.public_sg
}
output "private_sg" {
  value = aws_security_group.private_sg
}