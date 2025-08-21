resource "massdriver_artifact" "endpoint" {
  field    = "endpoint"
  name     = "Azure Cognitive Service Language ${module.cognitive_services.account_name}"
  artifact = jsonencode(
    {
      data = {
        infrastructure = {
          ari = module.cognitive_services.account_id
        }
        authentication = {
          endpoint = module.cognitive_services.endpoint
        }
        security = {
          iam = {
            "read" = {
              role  = "Cognitive Services Language Reader"
              scope = module.cognitive_services.account_id
            }
            "read_write" = {
              role  = "Cognitive Services Language Writer"
              scope = module.cognitive_services.account_id
            }
          }
        }
      }
      specs = {
        azure = {
          region = module.cognitive_services.account_location
        }
      }
    }
  )
}
