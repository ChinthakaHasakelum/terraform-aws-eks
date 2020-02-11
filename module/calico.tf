resource "null_resource" "calico" {
  count = var.calico_enabled ? 1 : 0

  provisioner "local-exec" {
    working_dir = path.module
    command = <<EOS
       kubectl apply -f ${path.module}/files/calico.yaml
    EOS

    interpreter = var.local_exec_interpreter
  }

  depends_on = [aws_eks_cluster.this]
}