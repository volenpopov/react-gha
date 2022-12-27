# Terraform Bootstrap Steps

- navigate to the `infrastructure/bootstrap/` folder
- `terraform init`
- `terraform apply`
- copy the `cicd_role_arn` terraform output value and set it as a secret under the Actions section (with the name of `ROLE_ARN`) in your repository settings ([screenshot](../../screenshots/role-arn-secret.png))
- copy the `bucket_name` terraform output value
  - open the `infrastructure/terraform/main.tf` file and paste it in the following block: `backend "s3" { bucket = "" }` ([screenshot](../../screenshots/update-backend-bucket.png))
  - open the `infrastructure/bootstrap/main.tf` file and uncomment the `backend "s3"` part
- re-run `terraform init`
  - you will be prompted to enter the S3 bucket name, which you copied a couple of steps ago, so you can just paste it now
  - you will be prompted to enter the region, enter `us-east-1`
  - you will be prompted whether you want to copy existing state to the new backend, enter `yes`
- with the `terraform.tfstate` file successfully migrated to our new S3 backend, you can safely delete the local `terraform.tfstate` and `terraform.tfstate.backup` files
