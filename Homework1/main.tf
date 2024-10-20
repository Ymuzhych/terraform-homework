provider "aws" {
  region = "us-east-1"
}  
 #terraform import aws_iam_user.Mina  Mina
 resource "aws_iam_user" "Mina" {
  name = "Mina"
  
}  
#terraform import aws_iam_user.Miyeon  Miyeon 
resource "aws_iam_user" "Miyeon" {
  name = "Miyeon"
  
}  
