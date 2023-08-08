variable "obj" {
    description = "(optional) describe your variable"
    default = {
        gopi = {
            maths = "45"
            science = "50"
        }
        mokshi = {
            maths = "100"
            science = "100"
            social = ["100","200"]
        }

    }
}