resource "google_compute_instance" "bedrock" {
    name         = "bedrock"
    machine_type = "n1-standard-1"
    zone         = var.zone

    tags = ["bedrock"]

    boot_disk {
        initialize_params {
            image = var.gcp_disk_image
        }
    }

    network_interface {
        network = "default"

        access_config {
        // Ephemeral IP
        }
    }

    metadata_startup_script = data.template_file.metadata_startup_script.rendered

    metadata = {
        ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
    }

    service_account {
        scopes = ["userinfo-email", "compute-ro", "storage-ro"]
    }

    scheduling {
        preemptible = true
        automatic_restart = false
    }
}

data "template_file" "metadata_startup_script" {
    template = "${file("templates/startup.sh")}"
}