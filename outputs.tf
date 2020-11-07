output "bedrock_ip" {
    value = google_compute_instance.bedrock.network_interface.0.access_config.0.nat_ip
}

# output "nameservers" {
#     value = google_dns_managed_zone.minecraft.name_servers
# }
