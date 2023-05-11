resource "google_compute_instance" "default_5" { #comment
  name         = "test-tf-${terraform.workspace}"
  machine_type = var.image_id
  zone         = "europe-west3-b"
  project      = "abels-magical-playground"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  attached_disk {
    source = google_compute_disk.pd.self_link
  }
}

resource "google_compute_disk" "pd" {
  project = "abels-magical-playground"
  name    = "${terraform.workspace}-data-disk"
  type    = "pd-ssd"
  zone    = "europe-west3-b"
  size    = 10
}

resource "google_compute_instance" "default-2" {
  name         = "test-tf2-${terraform.workspace}"
  machine_type = "e2-medium"
  zone         = "europe-west4-a"
  project      = "abels-magical-playground"

  tags = ["foo", "bar", "baz"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
}