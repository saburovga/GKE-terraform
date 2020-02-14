data "template_file" "kubeconfig" {
  template = "${file("config.tpl")}"

  vars = {
    cluster_ca_certificate = "${google_container_cluster.jenkinsx.master_auth.0.cluster_ca_certificate}"
    endpoint               = "${google_container_cluster.jenkinsx.endpoint}"
    suffix                 = "${google_container_cluster.jenkinsx.project}_${coalesce(var.region, var.zone)}_${google_container_cluster.jenkinsx.name}"
    gcloud_path = "${var.gcloud_path}"
  }
}