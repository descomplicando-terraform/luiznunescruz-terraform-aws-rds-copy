variable "region_source" {
  description = "Região do RDS que será copiado"
}

variable "aws_profile_source" {
  default     = "default"
  description = "Profile da AWS que será utilizado."
}

variable "db_instance_identifier_source" {
  description = "Nome da instância RDS que será copiada."
}

variable "region_destination" {
  description = "Região para onde o RDS será copiado"
}

variable "db_instance_identifier_destination" {
  description = "Nome da instância para onde o RDS será copiado."
}

variable "instance_class_destination" {
  default     = ""
  description = "Tipo de instância que será criada no destino. Ao deixar em branco usará o mesmo tipo de instância da fonte."
}

variable "db_subnet_group_name_destination" {
  default = ""
  description = "Nome do Grupo de sub-redes para onde o RDS será copiado. Ao deixar em branco será criado no Grupo de sub-rede Padrão. Caso não exista será criado."
}

variable "subnet_ids_destination" {
  description = "Ids das VPC sub-redes para a criação de um Grupo de sub-redes para onde o RDS será copiado."

}
