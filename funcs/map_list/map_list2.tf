variable "service_bus" {
  default = {
    "topicA" = {
      subs = ["subA", "subB"]
    },
    "topicB" = {
      subs = ["subC", "subD"]
    }
  }
}


locals {
  subs_topics = flatten([
    for topic_key, topics in var.service_bus : [
      for sub_key, sub in topics.subs : {
        topics = topic_key
        subs   = sub
      }
    ]
  ])
  subs_topics_maps = { for topic in local.subs_topics : "${topic.subs}" => topic }
}


output "subs_topics" {
  value = local.subs_topics
}

output "subs_maps" {
  value = local.subs_topics_maps
}



resource "azurerm_servicebus_topic" "topics" {
  for_each            = local.subs_topics_maps
  name                = each.value.topics
  resource_group_name = azurerm_resource_group.example.name
  namespace_name      = azurerm_servicebus_namespace.example.name
  enable_partitioning = true
}

resource "azurerm_servicebus_subscription" "subs" {
  for_each            = local.subs_topics_maps
  name                = each.value.subs
  resource_group_name = azurerm_resource_group.example.name
  namespace_name      = azurerm_servicebus_namespace.example.name
  topic_name          = azurerm_servicebus_topic.topics[each.key].name
  max_delivery_count  = 1
}



resource "azurerm_resource_group" "example" {
  name     = "tfex-servicebus-subscription"
  location = "West Europe"
}

resource "azurerm_servicebus_namespace" "example" {
  name                = "tfex-servicebus-namespace"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "Standard"

  tags = {
    source = "terraform"
  }
}

provider "azurerm" {
  features {

  }
}

