# CloudFront, S3, Route53

Reusable module to setup a bucket with limited public access, favouring
CloudFront OAC. Also set up Route53 records for the distribution. Example module
invocation:

```terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {}
}

provider "aws" {
  region = "eu-west-2"
}

provider "aws" {
  alias  = "n-virginia"
  region = "us-east-1"
}

module "cached_bucket" {
  source = "git::https://github.com/afneville/cached-bucket-tf.git?ref=v1"

  providers = {
    aws.n-virginia = aws.n-virginia
  }

  bucket_name = ""
  subdomain   = ""
  domain      = ""
}
```
