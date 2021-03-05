Steps to create the VM on the Azure
1. Terraform should be installed
2. Need to provide the required subscription_id,client_id,client_secret,tenant_id of the azure account in the VMCreation/main.tf file.
3. Run the command terraform init //To initilaize 
4. Run the command terraform plan //To preview the plan
5. Run the command terraform apply // It will start creating the VM's able to communicate with each other by private IP

Steps to get the metrics on the CPU, Disk, and Memory usage
1.Run the metrics.sh inside the metrics folder it will fetch the CPU, Disk usage, Memory usage, and print on the console.

Exercise - 2
1. Make sure wherever the shell script(install.sh) going to run must have sudo/root access because script will install docker, if it is not installed and if docker is installed, should have the access to run the container.
2. If the port 9200,9300 is not free elastic-search docker container will not run. please make sure ports are free.
3. Once elastic-search docker is installed it will check the health of elastic-search it will print as OK then you can start work on that.