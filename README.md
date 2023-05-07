# Terraform Practice (IAC)

- [x] Use Terraform to create AWS Resources
- [ ] Use AWS Lambda to trigger an event

# Instructions

To run this Project, you must have an AWS account with an 'access key' 'and a secret access key'.

1. Create `.aws` folder in the root directory.
2. Inside .aws directory, create a `credentials` file.
3. Copy into credentials file and fill in your credentials:
   ```
   [aws-cred]
   aws_access_key_id = "YOUR_ACCESS_KEY_ID"
   aws_secret_access_key = "YOUR_SECRET_ACCESS_KEY"
   ```
4. <b>cd</b> into infrastructure using the terminal and run `terraform init` command to initializes the working directory.
5. run `terraform plan -var-file=variables/var_dev.tfvars` command to preview the actions terraform will take
6. run `terraform apply -var-file=variables/var_dev.tfvars` command to apply the changes
7. To Destroy infrastructure, run `terraform destroy`
