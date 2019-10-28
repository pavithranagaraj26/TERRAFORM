#configure the aws provider
'''
provider "aws" {
    region = "us-east-1"
}
'''

#create an EC2 instance
'''
resource "aws_instance" "example" {
    #ami if for amazon linux 2016.03.0(hvm)
    ami= "ami-08111162"
    instance_type = "t2.micro"
    tags {
        Name= "example" or "$(var.instance_name)"
    }
    
}

# modules new main.tf--> can share the module
# search the terraform module registry

'''
#server one named foo
module "foo" {
    source =" file path"
    instance_name="foo"
}
#server two named bar
module "bar" {
    source =" file path"
    instance_name="bar"
}
'''
terraform init
t plan
t apply

#how to use modules in registry

t init hasicorp/vault/aws
t apply
