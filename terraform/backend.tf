
terraform {
  backend "s3" {
    bucket  = "terraform-state-311008325132" #pixel-systems-org account
    region  = "eu-west-1"
    encrypt = true

    # key =  # SPECIFIED AS INIT INPUT VARIABLE
  }
}