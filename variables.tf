################################################################################
#############             SOURCE VARIABLES                    ##################
################################################################################
variable "region_source" {}

variable "aws_profile_source" {}

variable "db_instance_identifier_source" {}

################################################################################
#############             DESTINATION VARIABLES               ##################
################################################################################

variable "region_destination" {}

variable "db_instance_identifier_destination" {}

variable "instance_class_destination" {
  default     = ""
  description = "Tipo de instância que será criada no destino. Ao deixar em branco usará o mesmo tipo de instância da fonte"
}

variable "db_subnet_group_name_destination" {
  default = ""
}

variable "subnet_ids_destination" {}
