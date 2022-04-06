terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
    region = "us-west-2"  
}

###creat VPC
resource "aws_vpc" "itayShlomy" {
  cidr_block       = "127.168.1.0/24"
  tags = {
    Name = "itayShlomy"
  }
}
 ###creat Web-subnet
resource "aws_subnet" "Web_subnet" {
  vpc_id = aws_vpc.itayShlomy.id
  cidr_block       = "127.168.1.0/27"
  tags = {
    Name = "Web_subnet"
  }
}

###creat App-subnet
resource "aws_subnet" "App_subnet" {
    vpc_id = aws_vpc.itayShlomy.id
  cidr_block       = "127.168.1.32/27"
  tags = {
    Name = "App_subnet"
  }
}

###creat DB-subnet
resource "aws_subnet" "DB_subnet" {
    vpc_id = aws_vpc.itayShlomy.id
  cidr_block       = "127.168.1.64/28"
  tags = {
    Name = "DB_subnet"
  }
}