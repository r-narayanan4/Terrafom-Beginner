provider "aws" {
    region = "ap-south-2"
    shared_credentials_files = ["C:\\Users\\RLnar\\.aws\\credentials"]
}

resource "aws_s3_bucket" "example" {
  bucket = "rlnr410bucker229"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

import {
  to = aws_s3_bucket.example
  id = "rlnr410bucker229"
}