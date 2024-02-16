# set terminal environment variables required for any command below
export AWS_REGION=<add the AWS region here> && export AWS_PROFILE=<add the aws profile here>

# create the cdk code structure
cdk init app --language java

cdk deploy --profile gmx-net

cdk destroy --profile gmx-net