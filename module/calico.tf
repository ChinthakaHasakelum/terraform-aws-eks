resource "null_resource" "calico" {
  count = var.calico_enabled ? 1 : 0

  provisioner "remote-exec" {
    working_dir = path.module
    command = <<EOS
       kubectl apply -f https://docs.projectcalico.org/v3.8/manifests/calico.yaml
    EOS
  }

  depends_on = [aws_eks_cluster.this]
}