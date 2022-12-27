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
- programmatic access to AWS (aws cli)
- your own domain (purchased from AWS Route53)

#### NOTE:

It is recommended to stick with the versions outlined for Node (in the `.nvmrc` file) and for Terraform (in the `infrastructure/terraform/.terraform.version` file). You can easily do so by utilzing tools such as [nvm](https://github.com/nvm-sh/nvm) and [tfswitch](https://github.com/warrensbox/terraform-switcher).

#### Steps:

1.  Clone the repository
2.  `npm install`
3.  Update all `# TODO:` placeholders with the appropriate values for you ([screenshot](screenshots/update-todos-placeholders.png))
4.  Bootstrap Terraform - this will provision the infrastructure required to store your terraform state remotely and also the IAM role assumed by the Github Actions CICD worker through OIDC ([see here](infrastructure/bootstrap/README.md))
5.  Commit and push your changes, create a pull request and merge it (e.g. `chore: provision initial infrastructure`) - with the updated values for the placeholders and the infrastructure for the remote Terraform backend provisioned, you can now proceed with creating your first pull request, which will provision all of the infrastructure required for the React application (Route53 records, ACM certificates, CloudFront distribution, S3 bucket, etc.). It is a good idea to keep an eye on the deployment pipeline as the creation of the CloudFront distribution can take up to 15min.
6.  At this point you should now be able to access your website on the domain that you have specified earlier or by prepending it with `www.`

### Cleanup

- navigate to the `infrastructure/terraform/` folder
- `terraform destroy`
- navigate to the `infrastructure/bootstrap/` folder
- `terraform init -migrate-state`
  - you will be prompted whether you want to copy the existing state to the new backend, enter `yes`
- `terraform destroy`
