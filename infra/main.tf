provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "google_compute_instance" "colleague_vm" {
  name         = "soldier-${var.project_name}"
  machine_type = "c3d-standard-4"
  
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2404-lts-amd64"
      size  = 50
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    # Forge Protocol Bootstrap
    curl -sSL https://raw.githubusercontent.com/forge-clawd/agent-blueprint/master/bootstrap.sh | bash -s -- ${var.project_name}
  EOT

  service_account {
    scopes = ["cloud-platform"]
  }
}
