/* FOR this file you need to change the line 68 identifiers to be your own account number */




# This code has left our bucket open to the public.check "
# We need to remidiate this by creating a new bucket with access controls
# Only our internal IPs should be able to access the bucket

# resource "aws_s3_bucket" "exopsed-bucket-51508"{
#   bucket = "lootbucket-do-not-do-this-0101"

#   tags = {
#     Name = "exposed-bucket"
#     Env  = "prod"
#   }
# }

# resource "aws_s3_bucket_public_access_block" "wide-open-bucket" {
#   bucket = aws_s3_bucket.exopsed-bucket51508.id

#   block_public_acls       = false
#   ignore_public_acls      = true
#   restrict_public_buckets = true
#   block_public_policy     = true
  
# }

# resource "aws_s3_bucket_acl" "goofed" {
#   bucket = aws_s3_bucket.exopsed-bucket51508.id
#   acl    = "public-read"
#   # This is a bad idea, but we are doing it to demonstrate the problem
# }

provider "aws" {
  region = "us-east-1"
}
resource "aws_s3_bucket" "exposed-bucket-that-could-kazaa123" {
  bucket = "mattress-avengers-armageddon-bucket232"
 
  tags = {
    Name        = "Exposed bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "exposed-bucket-that-could-kazaa123" {
  bucket = "exposed-bucket"

  block_public_acls       = false
  ignore_public_acls      = true
  restrict_public_buckets = true
  block_public_policy     = true
}


resource "aws_s3_bucket_policy" "exposed-bucket-that-could-kazaa123" {
  bucket = aws_s3_bucket.exposed-bucket-that-could-kazaa123.id
  policy = data.aws_iam_policy_document.exposed-bucket-that-could-kazaa123.json
}


data "aws_iam_policy_document" "exposed-bucket-that-could-kazaa123" {
  statement {
    sid = "AllowAccessFromSpecificAccountAndIP"

    principals {
      type        = "AWS"
      identifiers = ["XXXXXXXXXXXX"] #Change this to your own account number, not mine because You TOUCH AND DIE!!!
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.exposed-bucket-that-could-kazaa123.arn,
      "${aws_s3_bucket.exposed-bucket-that-could-kazaa123.arn}/*"
    ]

    condition {
      test     = "IpAddress"
      variable = "aws:SourceIp"
      values   = ["172.19.11.0/24"]
    }
  }

  statement {
    sid    = "DenyAccessOutsideAllowedIP"
    effect = "Deny"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = ["s3:*"]

    resources = [
      aws_s3_bucket.exposed-bucket-that-could-kazaa123.arn,
      "${aws_s3_bucket.exposed-bucket-that-could-kazaa123.arn}/*"
    ]

    condition {
      test     = "NotIpAddress"
      variable = "aws:SourceIp"
      values   = ["172.19.11.0/24"]
    }
  }
}


# terraform {
#     backend "s3" {
#         bucket = "mattress-avengers-armageddon-2"
#         key = "tokyo-key-pair"
#         region = "ap-northeast-1"      
# }
# }