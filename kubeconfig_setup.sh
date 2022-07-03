#!/bin/bash
export KUBECONFIG=$KUBECONFIG:~/.kube/config
trap "rm -f /tmp/infrastructure" EXIT

describe_stacks () {
  aws cloudformation --region us-east-1 describe-stacks --stack-name $1 \
    --query 'Stacks[0].Outputs[]' --o json
}

filter_stack() {
  describe_stacks $1 | jq '.[] | select(.OutputKey | match("^fuguestate.*Command.*$";"i")) | .OutputValue'
}

while true
do
  if read line; then
    eval $line
  else
    break
  fi
done < <(filter_stack InfrastructureStack)
