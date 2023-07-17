locals {
  this_sg_id = var.create_sg ? sbercloud_networking_secgroup.this[0].id : var.security_group_id
}

resource "sbercloud_networking_secgroup" "this" {
  count                 = var.create && var.create_sg ? 1 : 0
  delete_default_rules  = var.delete_default_rules
  description           = var.description
  enterprise_project_id = var.enterprise_project_id
  name                  = var.name
  region                = var.region
}

resource "sbercloud_networking_secgroup_rule" "ingress_rules" {
  count = var.create ? length(var.ingress_rules) : 0

  region                  = lookup(var.ingress_rules[count.index], "region", null)
  direction               = "ingress"
  ethertype               = lookup(var.ingress_rules[count.index], "ethertype", "IPv4")
  description             = lookup(var.ingress_rules[count.index], "description", null)
  protocol                = lookup(var.ingress_rules[count.index], "protocol", "tcp")
  port_range_min          = lookup(var.ingress_rules[count.index], "port_range_min", null)
  port_range_max          = lookup(var.ingress_rules[count.index], "port_range_max", null)
  ports                   = lookup(var.ingress_rules[count.index], "ports", null)
  remote_ip_prefix        = lookup(var.ingress_rules[count.index], "remote_ip_prefix", null)
  remote_group_id         = lookup(var.ingress_rules[count.index], "remote_group_id", null)
  remote_address_group_id = lookup(var.ingress_rules[count.index], "remote_address_group_id", null)
  security_group_id       = local.this_sg_id
  action                  = lookup(var.ingress_rules[count.index], "action", null)
  priority                = lookup(var.ingress_rules[count.index], "priority", null)
}


resource "sbercloud_networking_secgroup_rule" "egress_rules" {
  count = var.create ? length(var.egress_rules) : 0

  region                  = lookup(var.egress_rules[count.index], "region", null)
  direction               = "egress"
  ethertype               = lookup(var.egress_rules[count.index], "ethertype", "IPv4")
  description             = lookup(var.egress_rules[count.index], "description", null)
  protocol                = lookup(var.egress_rules[count.index], "protocol", "tcp")
  port_range_min          = lookup(var.egress_rules[count.index], "port_range_min", null)
  port_range_max          = lookup(var.egress_rules[count.index], "port_range_max", null)
  ports                   = lookup(var.egress_rules[count.index], "ports", null)
  remote_ip_prefix        = lookup(var.egress_rules[count.index], "remote_ip_prefix", null)
  remote_group_id         = lookup(var.egress_rules[count.index], "remote_group_id", null)
  remote_address_group_id = lookup(var.egress_rules[count.index], "remote_address_group_id", null)
  security_group_id       = local.this_sg_id
  action                  = lookup(var.egress_rules[count.index], "action", null)
  priority                = lookup(var.egress_rules[count.index], "priority", null)
}
