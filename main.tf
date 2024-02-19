#single line comments

/* this
is 
multi line comments
*/

#Block
block type {
    attribute1 = value1
    attribute2 = value2
}
#provider block
provider "aws" {
    region = "us-west-2"
}

#resource block
resource "aws instance" "example"{
    ami = "ami - 0853648"
    instance_type = "t2.micro"

}

#variable block
 variable "aws region" {
    description = "aws region to launch resources"
    type = string
    default = "us-west-2"
 }

 #datablock
 data "aws_ami" "example" {
    most_recent = true
    owners = ["self"]
    filters  {
      name = "ubuntu"
      root_design_type = "abc"
        }
 }
#Attributes

resource "aws instance" "example"{
  ami = "ami 0bc527899"
  instance_type = "t2.micro"
  count = 3
  enabled = true
}

#Data types

/* string
number
boolean
lists
maps
*/
# lists
list = [ "item1","item2","item3"]
security_groups = [ "sg1" , "sg2"]
#maps

variable "example map"{
    type = map
    default = { key1 = "value1", key2 = "value2", key3 = "value3"}

}

locals {
  my_map = { "name" = "johncena" , "age" = 30 , "is_admin" = true}
}

# if u want value of age
local.my_map.["age"]

#Conditions
resource "aws_instance" "server"{
    instance_type = var.environment == "development" ? "t2.micro" : "t2.small"
    }
#functions
locals {
    name = "john cena"
    fruits = [ "apple" , "banana" , "mango"]
    message = "hello ${upper(local.name)}!  I know you like ${join("," , local.friuts)}"
    }
#Resource dependency

/* Implicity dependency
Explicity dependecy
*/
resource "aws_instance" "name" {
    vpc_security_group_ids = aws_security_group.mysg.id
  
}
resource "aws_security_group" "mysg" {
    #inboundrules
  
}

#multiple providers
 resource "aws instance" "web" {
    ami = "ami - 05ahnklca"
    instance_type = "t2.micro"
    provider = aws.west
   # use provider to use for particular region
 }