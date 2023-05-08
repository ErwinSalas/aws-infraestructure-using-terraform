output "bastion_host" {
  value       = "ssh -i key.pem ubuntu@${module.ec2.bastion_public_ip}"
  description = "bastion SSH"
}