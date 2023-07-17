output "id" {
  description = "The resource ID in UUID format."
  value       = try(sbercloud_networking_secgroup.this[0].id, "")
}
