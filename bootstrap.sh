#/bin/bash
export DOT_FILES=$(dirname $0)
#$DOT_FILES/aws_setup.sh
#$DOT_FILES/git_id_rsa.sh
envsubst '$DOT_FILES' < append.rc >> ~/.zshrc
