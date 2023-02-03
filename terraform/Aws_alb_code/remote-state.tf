# Aqui estou criando estados remotos para terraform, isso é muito importante quando você trabalha com uma equipe
terraform {
  backend "s3" {
    bucket = "bucket-t00w3ewf6s65df41165sdf534112"
    key    = "terraform/Aws_alb_code/terraform.tfstate"
    region = "us-east-1"
  }
}
