
variable "repo_config" {
  type = list(object({
    repo_name                = string
    retention_in_days        = optional(number)
    vuln_contextual_analysis = optional(bool)
    path_config_values = optional(object({
      list_pattern = optional(list(object({
        include             = optional(string)
        exclude             = optional(string)
        index_new_artifacts = optional(bool)
        retention_in_days   = optional(number)

      })))
      all_other_artifacts_config_index_new_artifacts = optional(bool)
      all_other_artifacts_config_retention_in_days   = optional(number)
    }))
  }))
  default = [
    {
      repo_name                = "repo1"
      retention_in_days        = 7
      vuln_contextual_analysis = true
      path_config_values = {
        all_other_artifacts_config_index_new_artifacts = true
        all_other_artifacts_config_retention_in_days   = 7
        list_pattern = [
          {
            include             = "repo1/include/**"
            exclude             = "repo1/exclude/**"
            index_new_artifacts = true
            retention_in_days   = 14
          },
          {
            include             = "repo1/repo/include/**"
            exclude             = "repo1/repo/exclude/**"
            index_new_artifacts = true
            retention_in_days   = 14
          },
          {
            include             = "repo1/repo100/include/**"
            exclude             = "repo1/repo100/exclude/**"
            index_new_artifacts = true
            retention_in_days   = 14
          },

        ]
        all_other_artifacts_config = {
          all_other_artifacts_config_index_new_artifacts = true
          all_other_artifacts_config_retention_in_days   = 7
        }
      }
    },
    {
      repo_name = "repo2"
    }
  ]

}



resource "xray_repository_config" "config" {
  for_each  = { for repo in var.repo_config : repo.repo_name => repo }
  repo_name = each.key
  config {
    retention_in_days        = try(each.value.retention_in_days, 7)
    vuln_contextual_analysis = try(each.value.vuln_contextual_analysis, true)
  }
  dynamic "paths_config" {
    for_each = try(length(each.value.path_config_values.list_pattern) > 0 ? ["true"] : [], [])
    content {
      dynamic "pattern" {
        for_each = each.value.path_config_values.list_pattern
        content {
          include             = pattern.value.include
          exclude             = pattern.value.exclude
          index_new_artifacts = pattern.value.index_new_artifacts
          retention_in_days   = pattern.value.retention_in_days
        }
      }
      all_other_artifacts {
        index_new_artifacts = each.value.path_config_values.all_other_artifacts_config_index_new_artifacts
        retention_in_days   = each.value.path_config_values.all_other_artifacts_config_retention_in_days
      }
    }
  }
}

