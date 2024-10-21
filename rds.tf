################################################################################
#################               GENERAL          ###############################
################################################################################
locals {
  db_snapshot_identifier = format("%s-%s", var.db_instance_identifier_source, formatdate("DD-MM-YYYY", timestamp()))
}

################################################################################
#################               RDS SOURCE        ##############################
################################################################################
data "aws_db_instance" "rds_source" {
  db_instance_identifier = var.db_instance_identifier_source
}
resource "aws_db_snapshot" "this" {
  count = try(data.aws_db_instance.rds_source.db_instance_identifier, "") == var.db_instance_identifier_source ? 1 : 0

  db_instance_identifier = var.db_instance_identifier_source
  db_snapshot_identifier = local.db_snapshot_identifier

  tags = {
    Name = local.db_snapshot_identifier
  }
}

################################################################################
#################             RDS DESTINATION        ###########################
################################################################################
resource "aws_db_instance" "rds_destination" {
  identifier     = var.db_instance_identifier_destination
  instance_class = var.instance_class_destination == "" ? data.aws_db_instance.rds_source.db_instance_class : var.instance_class_destination

  snapshot_identifier = aws_db_snapshot.this[0].db_snapshot_identifier
  # replicate_source_db = true

  storage_encrypted       = true
  skip_final_snapshot     = true
  backup_retention_period = 5

  #   manage_master_user_password = true
  db_subnet_group_name = var.db_subnet_group_name_destination == "" ? null : aws_db_subnet_group.this[0].name

  # vpc_security_group_ids = [aws_security_group.sg-privado.id]

  depends_on = [
    aws_db_snapshot.this
  ]
}
################################################################################
#################           RDS SUBNET GROUP      ##############################
################################################################################
resource "aws_db_subnet_group" "this" {
  count = var.db_subnet_group_name_destination == "" ? 0 : 1
  name       = format("%s-subnet-group", var.db_instance_identifier_destination)
  subnet_ids = var.subnet_ids_destination
}