# Assume Role

The following bash script is used to assume a role in another AWS account from the CLI and store the credentials in a profile.

Use this script is when I want to authenticate to a client account on the CLI. I first grab CLI credentials for the rebura-identity account and stick them in my ~/.aws/credentials file then run:

AWS_PROFILE=identity ~/assume_role.sh 123456654321 ReburaIdentityRole ClientName

followed by

export AWS_PROFILE=ClientName

For most roles in client accounts, the session only lasts 1 hour, so this little script just helps out

