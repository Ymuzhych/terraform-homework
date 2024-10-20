provider "aws" {
  region = "us-east-1"
}  
 
 resource "aws_iam_user" "Mina" {
  name = "Mina"
  
}  

resource "aws_iam_user" "Miyeon" {
  name = "Miyeon"
  
}  
#terraform import aws_iam_user.Miyeon  Miyeon 
#terraform import aws_iam_user.Mina  Mina