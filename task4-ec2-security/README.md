As part of task2-ec2 deployment, You already have instaleed all pre-requites. Also, cloned the github repo.
If not, Please follow Pre-Requisites part on folder "task2-ec2/Readme.md"

## Deployment Instructions

### 1. Checkout to folder task4-ec2-security ( assuming you're at "berkely-assesment" folder )

cd task4-ec2-secuirty/

### 2. MOdify variables.tf variables.

  You will three variables in ther
  1. VPC_ID - Navigate to AWS console, VPC, there will be atleast one VPC per AWS account managed by AWS itself, copy that VPC ID and pass to this variable._
  2. public__subnets_id - Public subnets will be available under default VPC, Take atleast Two subnets and pass to this variables as a lIst.ALB needs atleast two public subnets._
  3. windows_ami - Pass the same ami ID , You used in ""task2-ec2/variables.tf". As we aregoing to attach ALB atrget group to it."_
 That's it. Click save and Initialize Terraform.

Once done, save it and head to start terraform.

### 3. Initialize Terraform

terraform init


### 4. Validate the Terraform Configuration

terraform validate


### 5. Plan the Deployment

terraform plan


### 6. Deploy the Infrastructure

terraform apply -auto-approve

_This command will provision the AWS ALB,WAF-ACL,Cloud front resources with proper attachment to route traffic to Ec2._

Traffic flow will be looks like this

[ User Request ] 
       ↓
[ AWS WAF ] (Filters malicious traffic)
       ↓
[ CloudFront ] (Distributes traffic & caches content)
       ↓
[ ALB ] (Forwards valid traffic)
       ↓
[ Target Group ] (Routes traffic)
       ↓
[ Windows EC2 (IIS) ] (Processes requests & serves app)
       ↓
[ Response Sent Back to User ]


