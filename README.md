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

#### NOTE:
You should stick with the versions outlined for NodeJS (in the `.nvmrc` file) and for Terraform (in the `infrastructure/terraform/.terraform.version` file). You can easily do so by utilzing tools such as `nvm` and `tfswitch`.

 #### Steps:
 1) Update all `# TODO:` placeholders with the appropriate values for you
 2) Bootstrap Terraform - this will provision the infrastructure required to store your terraform state remotely and also the IAM role assumed by the Github Actions CICD worker through OIDC ([see here](infrastructure/bootstrap/README.md))
 

  
