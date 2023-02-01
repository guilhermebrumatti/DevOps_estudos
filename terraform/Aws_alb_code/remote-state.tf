# Aqui estou criando estados remotos para terraform, isso é muito importante quando você trabalha com uma equipe
terraform {
  backend "s3" {
    bucket = "bucketestudosdevops1"
    key    = "terraform/Aws_alb_code/terraform.tfstate"
    region = "us-east-1"
  }
}

