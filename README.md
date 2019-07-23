# TERRAFORM
This is the public repo to beginners to terraform 
![TERRAFORM](Terraform.png)

The Guide to TERRAFORM
===================================== 
sudo yum update -y

#Prerequisites

##Uninstall old versions:

```sudo yum remove -y docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine```
## Install Docker CE
## Install Utils:

```sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2```
## Add the Docker repository:

```sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo```
## Install Docker CE:

```sudo yum -y install docker-ce```
## Start Docker and enable it:

```sudo systemctl start docker && sudo systemctl enable docker```
## Add cloud_user to the docker group:

```sudo usermod -aG docker cloud_user```
## Test the Docker installation:

docker --version
Configuring Swarm Manager node
On the manager node, initialize the manager:

docker swarm init \
--advertise-addr [PRIVATE_IP]
Configure the Swarm Worker node
On the worker node, add the worker to the cluster:

docker swarm join --token [TOKEN] \
[PRIVATE_IP]:2377
Verify the Swarm cluster
List Swarm nodes:

docker node ls
Install Terraform
Install Terraform 0.11.13 on the Swarm manager:

sudo curl -O https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip
sudo yum install -y unzip
sudo unzip terraform_0.11.13_linux_amd64.zip -d /usr/local/bin/
Test the Terraform installation:

terraform version

terraform
Common commands:
apply: Builds or changes infrastructure
console: Interactive console for Terraform interpolations
destroy: Destroys Terraform-managed infrastructure
fmt: Rewrites configuration files to canonical format
get: Downloads and installs modules for the configuration
graph: Creates a visual graph of Terraform resources
import: Imports existing infrastructure into Terraform
init: Initializes a new or existing Terraform configuration
output: Reads an output from a state file
plan: Generates and shows an execution plan
providers: Prints a tree of the providers used in the configuration
push: Uploads this Terraform module to Terraform Enterprise to run
refresh: Updates local state file against real resources
show: Inspects Terraform state or plan
taint: Manually marks a resource for recreation
untaint: Manually unmarks a resource as tainted
validate: Validates the Terraform files
version: Prints the Terraform version
workspace: Workspace management

Set up the environment:

mkdir -p terraform/basics
cd terraform/basics
Create a Terraform script:

vi main.tf
main.tf contents:

# Download the latest Ghost image
resource "docker_image" "image_id" {
  name = "ghost:latest"
}
Initialize Terraform:

terraform init
Validate the Terraform file:

terraform validate
List providers in the folder:

ls .terraform/plugins/linux_amd64/
List providers used in the configuration:

terraform providers
Terraform Plan:

terraform plan
Useful flags for plan:
-out=path: Writes a plan file to the given path. This can be used as input to the "apply" command.
-var 'foo=bar': Set a variable in the Terraform configuration. This flag can be set multiple times.

Terraform Apply:

terraform apply
Useful flags for apply:
-auto-approve: This skips interactive approval of plan before applying.
-var 'foo=bar': This sets a variable in the Terraform configuration. It can be set multiple times.

Confirm your apply by typing yes. The apply will take a bit to complete.

List the Docker images:

docker image ls
Terraform Show:

terraform show
Terraform Destroy:

terraform destroy
Confirm your destroy by typing yes.

Useful flags for destroys:
-auto-approve: Skip interactive approval of plan before applying.

Re-list the Docker images:

docker image ls
Using a plan:

terraform plan -out=tfplan
Applying a plan:

terraform apply tfplan
Show the Docker Image resource:

terraform show
Destroy the resource once again:

terraform destroy
More Reading
Terraform Commands-->terraform
Common commands:
apply: Builds or changes infrastructure
console: Interactive console for Terraform interpolations
destroy: Destroys Terraform-managed infrastructure
fmt: Rewrites configuration files to canonical format
get: Downloads and installs modules for the configuration
graph: Creates a visual graph of Terraform resources
import: Imports existing infrastructure into Terraform
init: Initializes a new or existing Terraform configuration
output: Reads an output from a state file
plan: Generates and shows an execution plan
providers: Prints a tree of the providers used in the configuration
push: Uploads this Terraform module to Terraform Enterprise to run
refresh: Updates local state file against real resources
show: Inspects Terraform state or plan
taint: Manually marks a resource for recreation
untaint: Manually unmarks a resource as tainted
validate: Validates the Terraform files
version: Prints the Terraform version
workspace: Workspace management

Set up the environment:

mkdir -p terraform/basics
cd terraform/basics
Create a Terraform script:

vi main.tf
main.tf contents:

# Download the latest Ghost image
resource "docker_image" "image_id" {
  name = "ghost:latest"
}
Initialize Terraform:

terraform init
Validate the Terraform file:

terraform validate
List providers in the folder:

ls .terraform/plugins/linux_amd64/
List providers used in the configuration:

terraform providers
Terraform Plan:

terraform plan
Useful flags for plan:
-out=path: Writes a plan file to the given path. This can be used as input to the "apply" command.
-var 'foo=bar': Set a variable in the Terraform configuration. This flag can be set multiple times.

Terraform Apply:

terraform apply
Useful flags for apply:
-auto-approve: This skips interactive approval of plan before applying.
-var 'foo=bar': This sets a variable in the Terraform configuration. It can be set multiple times.

Confirm your apply by typing yes. The apply will take a bit to complete.

List the Docker images:

docker image ls
Terraform Show:

terraform show
Terraform Destroy:

terraform destroy
Confirm your destroy by typing yes.

Useful flags for destroys:
-auto-approve: Skip interactive approval of plan before applying.

Re-list the Docker images:

docker image ls
Using a plan:

terraform plan -out=tfplan
Applying a plan:

terraform apply tfplan
Show the Docker Image resource:

terraform show
Destroy the resource once again:

terraform destroy
More Reading
Terraform Commands--> https://www.terraform.io/docs/commands/index.html
