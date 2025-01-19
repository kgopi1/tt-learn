variable "docker_repos" {
  type        = list(map(string))
  description = "List of docker repos"
  default = [
    {
      "repo_name"       = "testrepo1"
      "tag_retention"   = 5
      "max_unique_tags" = 5
    },
    {
      "repo_name" = "testrepo2"

    },
    {
      "repo_name"       = "testrepo3"
      "tag_retention"   = 25
      "max_unique_tags" = 55
    }

  ]
}

variable "tag_retention" {
  default = 10
}

variable "max_unique_tags" {
  default = 5
}

locals {
  docker_repos = { for repo in var.docker_repos :
    repo.repo_name => {
      key             = repo.repo_name
      tag_retention   = try(repo.tag_retention, var.tag_retention)
      max_unique_tags = try(repo.max_unique_tags, var.max_unique_tags)
    }

  }
}

output "docker_repos" {
  value = local.docker_repos
}

resource "artifactory_local_docker_v2_repository" "docker_repos" {
  for_each        = local.docker_repos
  key             = each.key
  tag_retention   = each.value.tag_retention
  max_unique_tags = each.value.max_unique_tags
}

