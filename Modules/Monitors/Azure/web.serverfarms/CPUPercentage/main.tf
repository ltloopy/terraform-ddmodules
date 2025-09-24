terraform {
  required_providers {
    datadog = {
      source  = "DataDog/datadog"
      version = "~> 3.0"
    }
  }
}

resource "datadog_monitor" "ElosityAzure_Cosmos_DB_-_Service_Availability" {
  evaluation_delay = 300
  new_group_delay = 60
  notify_by = ["name"]
  on_missing_data = "default"
  require_full_window = false
  monitor_thresholds {
    critical = 99
  }
  name = "[Elosity]Azure Cosmos DB - Service Availability"
  type = "query alert"
  tags = ["Org.Environment:prodeus", "Org.Environment:prodwus3", "Org.Product:Elosity", "integration:azure", "ResourceType:AzureCosmosDB", "team:elosity-production"]
  priority = 1
  query = <<EOT
sum(last_1h):min:azure.cosmosdb.service_availability{subscription_name:elosity_production} by {name,dd_resource_key,resource_group,subscription_name,region} < 99
EOT
  message = var.message
}