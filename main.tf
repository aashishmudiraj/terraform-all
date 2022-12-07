provider "aws" {
region = "us-east-1"
access_key = "AKIAUUJGILZHJBVB33ML"
secret_key = "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"
}

resource "aws_ebs_volume" "key"{
availability_zone = "us-east-1a"
size = 1
tags = {
Name = "vol-1"
}
}


resource "aws_iam_group" "Aashish"{
name = "Aashish"
}

resource "aws_iam_user" "user-1"{
name = "user-1"
}

resource "aws_iam_user" "user-2"{
name = "user-2"
}

resource "aws_iam_user" "user-3"{
name = "user-3"
}

resource "aws_iam_user" "user-4"{
name = "user-4"
}


resource "aws_iam_group_membership" "key"{
name = "key"
users = [
"${aws_iam_user.user-1.name}",
"${aws_iam_user.user-2.name}",
"${aws_iam_user.user-3.name}",
"${aws_iam_user.user-4.name}",
]
group = "${aws_iam_group.Aashish.name}"
}

resource "aws_s3_bucket" "key"{
bucket = "bucket-aashish"
}

resource "aws_s3_bucket_acl" "key"{
bucket = "bucket-aashish"
acl = "private"
}

resource "aws_s3_bucket_versioning" "key"{
bucket = "bucket-aashish"
versioning_configuration{
status    = "Enabled"
}
}

resource "aws_vpc" "key"{
cidr_block = "10.1.0.0/16"
tags = {
Name = "vpc-1"
}
}

resource "aws_subnet" "key"{
vpc_id = "vpc-id"
cidr_block = "10.1.0.0/24"
tags= {
Name = "subnet-1"
}
}

resource "aws_internet_gateway" "key" {
tags = {
Name = "gateway-1"
}
}
