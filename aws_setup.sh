#/bin/bash
AWS_DEFAULT_SSO_START_URL=https://fugue-state.awsapps.com/start/\#/
AWS_DEFAULT_SSO_REGION=us-east-1

rm -Rf ~/.aws/sso

aws-sso-util configure populate --sso-start-url $AWS_DEFAULT_SSO_START_URL --sso-region $AWS_DEFAULT_SSO_REGION --region $AWS_DEFAULT_SSO_REGION
