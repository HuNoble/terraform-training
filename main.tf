resource "google_compute_instance" "default_5" {
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