  ################################################################################
  #################             SOURCE            ################################
  ################################################################################
  region_source                 = "us-east-1"
  aws_profile_source            = "default"
  db_instance_identifier_source = "temp-teste"
  ################################################################################
  #################           DESTINATION         ################################
  ################################################################################
  region_destination                 = "us-east-1"
  db_instance_identifier_destination = "temp-teste-development"
  db_subnet_group_name_destination   = ""
  subnet_ids_destination             = ["subnet-08be3214efe23f981", "subnet-051f608cf4bbe5251"]