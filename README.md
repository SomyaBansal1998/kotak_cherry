# kotak_cherry
assignment for kotak cherry

## Steps

### 1. Use Terraform to create VPC, EKS Cluster and ALB

#### Go inside the terraform_test directory 
#### Run terraform commands post configuring your AWS account creds and terraform user
#### Number of server instances can be configured dynamically use 
```bash
-var="eks_desired_capacity=3" -var="eks_max_capacity=6" -var="eks_min_capacity=2"
```
### 2. Use ansible to install dependency on the nodes

#### Go inside ansible_test directory
#### Add the ips of the eks nodes in inventory/host.yaml
#### Run ansible command to install the depencies

### 3. Copy the Dockfiles in the respective apis folder

#### Go inside dockerfiles folder
#### copy the dockerfiles for each apis to their respective folder where the api code is present and rename the files as DockerFile

### 4. Update the image tags in deployment yamls

#### Go inside the deployment folder update the deployment.yml of each api with the image tag 

### 5. Run CI/CD to build the images and deploy the code

#### Go inside github_actions folder

#### Go the file to .github/workflows folder of the directory
#### Add the necesaary secrets in github secrets
#### Trigger the github action


### Note: Have used express api and gin api for his task
