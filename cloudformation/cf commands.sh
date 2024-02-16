# set terminal environment variables required for any command below
export AWS_REGION=<add the AWS region here> && export AWS_PROFILE=<add the aws profile here>
# create stack
aws cloudformation create-stack --stack-name cf-demo-stack --template-body file://template.yaml

# status check
aws cloudformation describe-stacks --stack-name cf-demo-stack

# update stack
aws cloudformation update-stack --stack-name cf-demo-stack --template-body file://template.yaml

# delete stack
aws cloudformation delete-stack --stack-name cf-demo-stack
