# luiznunescruz-terraform-aws-rds-copy
Módulo Terraform para realizar a cópia de bancos de dados RDS.

TODO:
- Implementar Cross-accounting:
    - Estudar melhor as limitações;
        - Criar KMS compartilhada;
        - ou Usar S3 para evitar erros de chaves;
- Verificar melhor forma de lhe dar com password do RDS:
    - Usar o Secret Manager;
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.72.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.rds_destination](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_snapshot.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_snapshot) | resource |
| [aws_db_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_db_instance.rds_source](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/db_instance) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_profile_source"></a> [aws\_profile\_source](#input\_aws\_profile\_source) | Profile da AWS que será utilizado. | `string` | `"default"` | no |
| <a name="input_db_instance_identifier_destination"></a> [db\_instance\_identifier\_destination](#input\_db\_instance\_identifier\_destination) | Nome da instância para onde o RDS será copiado. | `any` | n/a | yes |
| <a name="input_db_instance_identifier_source"></a> [db\_instance\_identifier\_source](#input\_db\_instance\_identifier\_source) | Nome da instância RDS que será copiada. | `any` | n/a | yes |
| <a name="input_db_subnet_group_name_destination"></a> [db\_subnet\_group\_name\_destination](#input\_db\_subnet\_group\_name\_destination) | Nome do Grupo de sub-redes para onde o RDS será copiado. Ao deixar em branco será criado no Grupo de sub-rede Padrão. Caso não exista será criado. | `string` | `""` | no |
| <a name="input_instance_class_destination"></a> [instance\_class\_destination](#input\_instance\_class\_destination) | Tipo de instância que será criada no destino. Ao deixar em branco usará o mesmo tipo de instância da fonte. | `string` | `""` | no |
| <a name="input_region_destination"></a> [region\_destination](#input\_region\_destination) | Região para onde o RDS será copiado | `any` | n/a | yes |
| <a name="input_region_source"></a> [region\_source](#input\_region\_source) | Região do RDS que será copiado | `any` | n/a | yes |
| <a name="input_subnet_ids_destination"></a> [subnet\_ids\_destination](#input\_subnet\_ids\_destination) | Ids das VPC sub-redes para a criação de um Grupo de sub-redes para onde o RDS será copiado. | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->