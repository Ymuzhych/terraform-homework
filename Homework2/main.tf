
resource "aws_key_pair" "bastion" {
  key_name   = "bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}
resource "aws_s3_bucket" "bucket1" {
  bucket = "kaizen-yuliia"

}
resource "aws_s3_bucket" "bucket2" {
  bucket_prefix = "kaizen-"

}
/*
terraform import aws_s3_bucket.bucket3 kaizen-yuliia3
*/
resource "aws_s3_bucket" "bucket3" {
  bucket = "kaizen-yuliia3"
}
/*
terraform import aws_s3_bucket.bucket4 kaizen-yuliia4
*/
resource "aws_s3_bucket" "bucket4" {
  bucket = "kaizen-yuliia4"
}


 resource "aws_iam_user" "d1" {
  for_each = toset(["jenny", "rose", "lisa", "jisoo"])
  name = each.value
 }

 resource "aws_iam_group" "group1" {
   name = "blackpink"
 }

resource "aws_iam_group_membership" "d2" {
  name = "testing-group-membership2"
  
  users = [
      for i in aws_iam_user.d1 : i.name 
  ]

  group = aws_iam_group.group1.name
    
}