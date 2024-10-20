resource "aws_iam_group" "blackpink" {
  name = "blackpink"
  
}
 
resource "aws_iam_group" "twice" {
  name = "twice"
  
}  
resource "aws_iam_group_membership" "blackpink" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.user1.name,
    aws_iam_user.user2.name, 
     aws_iam_user.user3.name,
    aws_iam_user.user4.name, 
        aws_iam_user.Miyeon.name,

  ]

  group = aws_iam_group.blackpink.name
} 
resource "aws_iam_group_membership" "twice" {
  name = "twice3"



  users = [
    aws_iam_user.user5.name,
    aws_iam_user.user6.name, 
     aws_iam_user.user7.name,
    aws_iam_user.user8.name, 
    aws_iam_user.Mina.name,
  ]

  group = aws_iam_group.twice.name
} 