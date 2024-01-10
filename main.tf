terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
  access_key = "AKIAYDAXJJRSVI57YADR"
  secret_key = "DwgDi1UsmKMoU42m5FQnJ0lQsLv/YNRTFzqufaEl"
  
}

# Create an IAM user
resource "aws_iam_user" "teja_user" {
  name = "teja-user" # Replace with your desired username

  # Optionally, add other user configurations like path, permissions, etc.
}

# Attach a policy to the user
resource "aws_iam_user_policy_attachment" "teja_user_amazons3fullaccess_attachment" {
  user       = aws_iam_user.teja_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess" # Replace with desired policy ARN
  # Add more policy attachments if needed
}

# Create a VPC
resource "aws_vpc" "naga_vpc" {
  cidr_block = "10.0.0.0/16" # Replace with your desired CIDR block for the VPC

  # Optionally, add more VPC configurations like tags, enable DNS support, etc.
}

# Create an internet gateway
resource "aws_internet_gateway" "example_igw" {
  vpc_id = aws_vpc.naga_vpc.id
}

# Create a subnet within the VPC
resource "aws_subnet" "example_subnet" {
  vpc_id     = aws_vpc.naga_vpc.id
  cidr_block = "10.0.1.0/24" # Replace with your desired CIDR block for the subnet

  # Optionally, add more subnet configurations like availability zone, route table associations, etc.
}

# Create a route table
resource "aws_route_table" "naga_route_table" {
  vpc_id = aws_vpc.naga_vpc.id
}
