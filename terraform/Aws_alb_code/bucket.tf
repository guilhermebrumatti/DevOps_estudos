# Definir a região
provider "aws" {
  region = "us-east-2"
}


resource "aws_s3_bucket" "bucket-t00w3ewf6s65df41165sdf534112" {

  bucket = "bucket-t00w3ewf6s65df41165sdf534112"

  tags = {
    Name        = "bucket-t00w3ewf6s65df41165sdf534112"
    Environment = "Dev"
    Managedby   = "Terraform"
    Autor       = "Gui"
  }

}

output "bucket-t00w3ewf6s65df41165sdf534112" {
  value = aws_s3_bucket.bucket-t00w3ewf6s65df41165sdf534112.bucket
}

output "bucket-t00w3ewf6s65df41165sdf534112-arn" {
  value = aws_s3_bucket.bucket-t00w3ewf6s65df41165sdf534112.arn
}
