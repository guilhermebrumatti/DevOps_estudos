resource "aws_s3_bucket" "bucket_python" {
    bucket = "bucketestudosdevops1"
    acl = "private"

    tags = {
        Name        = "Bucket Python"
        Environment = "Dev"
    }
}