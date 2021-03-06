resource "local_file" "kubeconfig" {
  count    = var.write_kubeconfig ? 1 : 0
  content  = data.template_file.kubeconfig.rendered
  filename = "${var.config_output_path}${var.cluster_name}.kubeconfig"
}
