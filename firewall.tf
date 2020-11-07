data "google_compute_network" "default-network" {
  name = "default"
}

resource "google_compute_firewall" "bedrock" {
    name    = "bedrock-firewall"
    network = data.google_compute_network.default-network.name

    allow {
        protocol = "icmp"
    }

    allow {
        protocol = "udp"
        ports    = ["19132","19133","58324","60484"]
    }

    allow {
        protocol = "tcp"
        ports    = ["22"]
    }

    source_ranges = [var.allowed_from]
    target_tags = ["bedrock"]
}