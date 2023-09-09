resource "aws_s3_bucket" "cybertalents" {
  bucket = "cybertalents-flask-app"
  acl    = "public-read"   
}