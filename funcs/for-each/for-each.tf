# Ref: https://developer.hashicorp.com/terraform/language/functions/flatten

variable "students_marks" {
  default = {
    gopi = {
      "english" = 50
      "maths"   = 100
    }
    mokshi = {
      "english" = 60
      "maths"   = 98
    }
  }
}

# List of students names
output "students" {
  value = keys(var.students_marks)
}

# list of subjects with marks. 
output "subjects" {
  value = values(var.students_marks)
}

# list of students with maths marks only

output "maths_students" {
  value = { for student, subj in var.students_marks : student => subj.maths }
}

output "maths_marks" {
  value = [for subj in var.students_marks : subj.maths]
}

output "maths_students_centum" {
  value = { for student, subj in var.students_marks : student => subj.maths if subj.maths == 100
  }
}

locals {
  get_students = [
    for key, value in var.students_marks : {
      name    = "${key}"
      english = "${value.english}"
      maths   = "${value.maths}"
    }
  ]

}

output "get_students" {
  value = local.get_students
}
