module "cognitive_services" {
  source                = "github.com/massdriver-cloud/terraform-modules//azure/cognitive-services?ref=be08a79"
  name                  = var.md_metadata.name_prefix
  location              = var.service.region
  custom_subdomain_name = var.md_metadata.name_prefix
  kind                  = "TextAnalytics" # This is the name of the Language service within the Terraform
  sku_name              = var.service.sku_name
  tags                  = var.md_metadata.default_tags
}
