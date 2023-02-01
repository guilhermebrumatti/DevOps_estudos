resource "aws_s3_bucket" "demo" {
    bucket = "${var.bucket_name}" 
    acl = "${var.acl_value}"   
}