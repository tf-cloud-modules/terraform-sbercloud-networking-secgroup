# Sbercloud Networking Secgroup Module

## How to Configure Terraform for Sbercloud

- [Sbercloud Quickstart](https://cloud.ru/ru/docs/terraform/ug/topics/quickstart.html)
- Add environment variables for terraform authentication in Sbercloud

```
export SBC_ACCESS_KEY="xxxx-xxx-xxx"
export SBC_SECRET_KEY="xxxx-xxx-xxx"
```

## Provider configuration
```hcl
provider "sbercloud" {
  auth_url = "https://iam.ru-moscow-1.hc.sbercloud.ru/v3"
  region   = "ru-moscow-1"
}
```

## Usage
```hcl
module "secgroup" {
    source  = "tf-cloud-modules/networking-secgroup/sbercloud"

    name = "sg-test"
    ingress_rules = [
    {
        description      = "All ingress traffic from a specified CIDR"
        remote_ip_prefix = "10.15.0.0/16"
    },
    {
        port_range_min   = 8080
        port_range_max   = 8090
        protocol         = "udp"
        description      = "User-service ports"
        remote_ip_prefix = "10.10.0.0/16"
    },
    {
        port_range_min  = 8888
        port_range_max  = 8888
        protocol        = "tcp"
        description     = "Traffic from certain sec group"
        remote_group_id = "xxxx-xxx-xxx"
    }
    ]

    egress_rules = [
    {
        description      = "Traffic to the Internet"
        remote_ip_prefix = "0.0.0.0/0"
    }
    ]
}
```
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_sbercloud"></a> [sbercloud](#requirement\_sbercloud) | >= 1.9.0, < 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_sbercloud"></a> [sbercloud](#provider\_sbercloud) | 1.11.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [sbercloud_networking_secgroup.this](https://registry.terraform.io/providers/sbercloud-terraform/sbercloud/latest/docs/resources/networking_secgroup) | resource |
| [sbercloud_networking_secgroup_rule.egress_rules](https://registry.terraform.io/providers/sbercloud-terraform/sbercloud/latest/docs/resources/networking_secgroup_rule) | resource |
| [sbercloud_networking_secgroup_rule.ingress_rules](https://registry.terraform.io/providers/sbercloud-terraform/sbercloud/latest/docs/resources/networking_secgroup_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input\_create) | Controls if resources should be created. | `bool` | `true` | no |
| <a name="input_create_sg"></a> [create\_sg](#input\_create\_sg) | Controls if security group should be created. | `bool` | `true` | no |
| <a name="input_delete_default_rules"></a> [delete\_default\_rules](#input\_delete\_default\_rules) | Controls if default rules should be deleted. | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | Specifies supplementary information about the security group. The value is a string of no more than 255 characters and cannot contain angle brackets. | `string` | `null` | no |
| <a name="input_egress_rules"></a> [egress\_rules](#input\_egress\_rules) | List of egress rules to create. | `list(map(string))` | `[]` | no |
| <a name="input_enterprise_project_id"></a> [enterprise\_project\_id](#input\_enterprise\_project\_id) | Specifies the enterprise project id of the security group. Changing this creates a new security group. | `string` | `null` | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | List of ingress rules to create. | `list(map(string))` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Specifies the name of the security group. The name must be unique for a tenant. The value is a string of no more than 64 characters and can contain digits, letters, underscores (\_), and hyphens (-). | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Specifies the region in which to create the security group. If omitted, the provider-level region will be used. Changing this creates a new security group. | `string` | `null` | no |
| <a name="input_security_group_id"></a> [security\_group\_id](#input\_security\_group\_id) | ID of existing security group to manage. | `string` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->