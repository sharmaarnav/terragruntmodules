resource "azurerm_app_service_plan" "example" {
  name                = "${var.prefix}-appserviceplan"
  location            = var.rglocation
  resource_group_name = var.rgname

  sku {
    tier = "Standard"
    size = "S1"
    capacity = 2
  }
}

resource "azurerm_app_service" "example" {
  name                = "${var.prefix}-app01"
  location            = var.rglocation
  resource_group_name = var.rgname
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
}

resource "azurerm_app_service" "example1" {
  name                = "${var.prefix}-app02"
  location            = var.rglocation
  resource_group_name = var.rgname
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
}