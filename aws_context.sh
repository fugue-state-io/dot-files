#/bin/bash
export AWS_PROFILE=$1
aws sts get-caller-identity
