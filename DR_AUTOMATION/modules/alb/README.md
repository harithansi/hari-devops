## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.53.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_alb.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb) | resource |
| [aws_alb_listener.alb_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_listener) | resource |
| [aws_alb_listener.ssl_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_listener) | resource |
| [aws_alb_target_group.alb_tg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_name"></a> [alb\_name](#input\_alb\_name) | Name of ALB | `string` | n/a | yes |
| <a name="input_alb_sg"></a> [alb\_sg](#input\_alb\_sg) | name of ALB securiry group | `string` | n/a | yes |
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | certificate ARN | `string` | n/a | yes |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | health check path | `string` | n/a | yes |
| <a name="input_ssl_policy"></a> [ssl\_policy](#input\_ssl\_policy) | ssl policy | `string` | n/a | yes |
| <a name="input_subnet_ids_public"></a> [subnet\_ids\_public](#input\_subnet\_ids\_public) | public Subnets to use | `list(string)` | n/a | yes |
| <a name="input_tg_name"></a> [tg\_name](#input\_tg\_name) | name of target group | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC to use | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_arn"></a> [alb\_arn](#output\_alb\_arn) | n/a |
| <a name="output_alb_hostname"></a> [alb\_hostname](#output\_alb\_hostname) | n/a |
| <a name="output_alb_listner"></a> [alb\_listner](#output\_alb\_listner) | n/a |
| <a name="output_alb_target_group"></a> [alb\_target\_group](#output\_alb\_target\_group) | n/a |
| <a name="output_alb_tg_arn"></a> [alb\_tg\_arn](#output\_alb\_tg\_arn) | n/a |
