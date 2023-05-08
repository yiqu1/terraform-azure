# Azure-WebApp-Infrastructure-Deployment-by-Terraform

- Create 
    - providers.tf ( to configure the provider ) , 
    - variables.tf ( to keep the variables ) , 
    - backend.tf ( to store the tfstate file in the Azure Cloud. Configure the existing or a new storage container )


1 - Create a Resource Group

2 - Create a Virtual Network

3 - Create 3 Subnets ( frontend , backend and middle subnet ) as we need 3 subnets when we use Load Balancer

4 - Create a Load Balancer. Create and connect new Public IP to the Load Balancer

5 - Create a Storage Account. ( independent from the containers that we use to store the BACKEND.TF )
#
INSIDE THE VIRTUAL-MACHINES.TF 

6 - Create a Virtual Machine as well as Availability Set to use the Load Balancer with high availability and more efficiently 

7 - Create a Storage Account Container inside the new storage account.

8 - Create Network Interface Card and connect to the subnets
#

- Run { terraform init } command and to see the plan run { terraform plan } command

- To provision the environment , run { terraform apply } command
