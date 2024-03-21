locals {
  services = {
     "service1": {
       "serviceName": "...",
       "errorNames": [....]
     },
     "service2": {
       "serviceName": "...",
       "errorNames": [....]
     },
   }
}


resource "datadog_dashboard" "new_dash" {
	
  # add dynamic in front of the block to repeat
  # this gives us one widget per service
  dynamic "widget" {

    # loop over services
    for_each = local.services

    # and name the iterator variable
    iterator = service

    # content keyword separates the iteration syntax and content
    content {
      group_definition {
        title = "each.value.serviceName"

        # another dynamic
        # one widget per error_name
        dynamic "widget" {
          # refer to the iterator variable "service"
          # and loop over its errors
          for_each = service.value.errorNames
          iterator = "error_name"

          content {...}
        }
      }
    }
  }
}