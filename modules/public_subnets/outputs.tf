output "subnet_ids" {
    value = {for k,v in aws_subnet.public: k => v.id}
}