resource "aws_key_pair" "homework" {
  key_name   = "homework"
  #public_key = file("~/.ssh/id_rsa.pub")
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDEqGRRmwKHkLhUTbkcE0lvaynbg8JB+Sy1Jx1Z00BlUfEZskrzsLMqn2z38mv2BMnT0avLVQn0SBe9/QsajfZXG5PnvkqKS62hRrCayHootJumfWuCvHIXE9HgCHgvaM49MLNX1nFS/mUj0K9x/h37BJJtRsl5xxHF9Bp+TRqvm8y9GPtxvUK7RzGsNxRuFEELbKIOnbRyt73uy7VviMV/8Jqm+4XtpdJ851fqvceaB1vnRpmiTnn09qUga42usM8INGp2zjTuweFHN4n5En+PRn+168x/5yiSdA61uWWzkJXRVJSfE3c21jL6mYkst8v8jvx54YN85Xt3jlIvvBJr3POby3Hroe8/zpacyV8toPiB8y9BI2LzpRnzUUqMOqOAWLRp+7rb2ib9FrgKdv0risDt/dQMILPOBnG3HH1ymDmsWEo2WaYQrc/bCtcCTtXsJHBBbuE/KxhrTO5O33ZNMwxvX5YPizUiCA9qHF1mngjEYjMadkstPjUsOA74qClzP5fSWLsxHZSxzmpoVnhAIHxqn+8lAfEB8nOQ+fLly3RtAKJFc1JaIDRoTCDjvyPCqgXSCUNHsXkbluuKIKPSEnLhrLHLdcOELWFUhvdwvqZMqs9k3N0WmvgNDgOjFlXskbNanDoYkRAzBnmdo7HxeqD7aNBDXiJjjoaqbCYamw== myuliia2018@gmail.com"
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