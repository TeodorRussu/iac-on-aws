# set terminal environment variables required for any command below
export AWS_REGION=<add the AWS region here> && export AWS_PROFILE=<add the aws profile here>

terraform init

terraform plan

terraform apply
