# React App

This project includes a sample best practice React app with the following:
- deployed on AWS (with infrastructure provisioned through Terraform)
- full CI/CD pipeline using GithubActions
- pre-commit and pre-push hooks
- automatic release (using the conventional commits specification and semantic versioning)

### Architecture:
![Solution Architecture](https://github.com/volenpopov/react-gha/blob/main/architecture.png)

### How to deploy?

#### Prerequisites
 - an AWS account
 - your own domain (purchased from AWS Route53)
 
 #### Steps:
 1) Update all `# TODO:` placeholders with the appropriate values for yourself
 2) Bootstrap Terraform - this will provision the infrastructure required to store your terraform state remotely and also the IAM role assumed by the Github Actions CICD worker through OIDC
  - `cd infrastructure/bootstrap/`
  - `terraform init`
  - `terraform apply`
  - copy the `cicd_role_arn` terraform output value and set it as a secret under the Actions section (with the name of `ROLE_ARN`) in your repository settings
  - copy the `bucket_name` terraform output value
  - open the `infrastructure/bootstrap/main.tf` file and uncomment the `backend "s3"` part
  - re-run `terraform init`
    - you will be prompted to enter the S3 bucket name, which you copied a couple of steps ago, so you can just paste it now
    - you will be prompted to enter the region, enter `us-east-1`
    - you will be prompted whether you want to copy existing state to the new backend, enter `yes`
  - with the `terraform.tfstate` file successfully migrated to our new S3 backend, you can safely delete the local `terraform.tfstate` and `terraform.tfstate.backup` files 
