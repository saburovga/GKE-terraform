provider "google" {
  credentials = file("../My First Project-e42f87bebfb4.json")
  project     = "ancient-ceiling-268211"
  region      = "us-central1"
}

resource "google_container_cluster" "jenkinsx" {
  name               = "jenkinsx"
  location           = "us-central1-a"
  initial_node_count = 3

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    metadata = {
      disable-legacy-endpoints = "true"
    }

    labels = {
      foo = "bar"
    }

    tags = ["foo", "bar"]
  }

  timeouts {
    create = "30m"
    update = "40m"
  }
}

resource "local_file" "kubeconfig" {
  content  = "${data.template_file.kubeconfig.rendered}"
  filename = "${var.kubeconfig}"
}