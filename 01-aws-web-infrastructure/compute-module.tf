module "compute" {
  source                = "./modules/compute"
  name_prefix           = local.name_prefix
  common_tags           = local.common_tags
  instance_profile_name = module.iam.instance_profile_name
  subnet_id             = module.networking.public_subnet_ids["public_1"]
  security_group_id     = module.security.security_group_id
  instance_type         = var.instance_type
}