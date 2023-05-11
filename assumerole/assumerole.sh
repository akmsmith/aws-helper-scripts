#! /bin/sh

if [[ "$#" -ne 3 ]]
then
  echo "3 arguments required, $# provided. "
  exit 1
fi

aws_account_id=$1
role_name=$2
profile_name=$3

echo "AWS Account ID: ${aws_account_id}"
echo "Role Name: ${role_name}"
echo "Profile Name: ${profile_name}"

role_arn="arn:aws:iam::${aws_account_id}:role/${role_name}"

echo "Assuming Role ${role_arn}"

username=`whoami`
credentials=`aws sts assume-role --role-arn "${role_arn}" --role-session-name "${username}" --region eu-west-1 --endpoint-url https://sts.eu-west-1.amazonaws.com`

echo "Credentials Received - Saving to ~/.aws/credentials"

access_key_id=`echo $credentials | jq -r .Credentials.AccessKeyId`
secret_access_key=`echo $credentials | jq -r .Credentials.SecretAccessKey`
session_token=`echo $credentials | jq -r .Credentials.SessionToken`

aws configure set --profile $profile_name aws_access_key_id $access_key_id
aws configure set --profile $profile_name aws_secret_access_key $secret_access_key
aws configure set --profile $profile_name aws_session_token $session_token

echo "Credentials Saved. Profile Name: ${profile_name}"

echo "Please run"
echo ""
echo "export AWS_PROFILE=$profile_name"
echo ""
echo ""
echo "To enable the profile '${profile_name}'"