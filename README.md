# Goals of this projects

- [ ] Use Terraform to create AWS Resources
- [ ] Use AWS Lambda to trigger an event

# Instructions

To run this Project, you must have an AWS account with an 'access key' 'and a secret access key'.

1. Create '.aws' folder in the root directory.
2. Inside .aws directory, create a 'credentials' file.
3. Copy into credentials file and fill in your creds:
   ```
   [aws-cred]
   aws_access_key_id = "YOUR_ACCESS_KEY_ID"
   aws_secret_access_key = "YOUR_SECRET_ACCESS_KEY"
   ```
4. cd into infrastructure using the terminal and run 'terraform init' command to initializes the working directory.
5. run 'terraform plan' command to preview the actions terraform will take
6. run 'terraform apply' command to apply the changes
