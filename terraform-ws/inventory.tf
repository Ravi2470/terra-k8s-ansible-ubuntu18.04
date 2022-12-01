resource "null_resource" "inventory_creation" {
    
    depends_on = [
      aws_instance.aws_k8s_master,
      aws_instance.aws_k8s_worker
    ]

provisioner "local-exec" {
  command = <<EOT
cat <<EOF > ../ansible-ws/inventory
[aws_k8s_master_host]
${aws_instance.aws_k8s_master.public_ip}

[aws_k8s_worker_host]
${aws_instance.aws_k8s_worker.public_ip}
EOF
    EOT
  }
}
