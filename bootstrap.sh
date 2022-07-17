#/bin/bash
export BOOTSTRAP_PATH=$(realpath "$0")
export DOT_FILES=$(dirname $BOOTSTRAP_PATH)
#$DOT_FILES/aws_setup.sh
#$DOT_FILES/git_id_rsa.sh
#TODO: ADD, KUBE_PS1 stuff
mkdir -p $DOT_FILES/.workspace/
cp ~/.zshrc $DOT_FILES/.workspace/.zshrc
sed -i -e '/###BEGIN_FUGUE_STATE_CONFIG###/,/###END_FUGUE_STATE_CONFIG###/d' ~/.zshrc
echo "###BEGIN_FUGUE_STATE_CONFIG###" >> ~/.zshrc
envsubst '$DOT_FILES' < $DOT_FILES/rc_files/append.rc >> ~/.zshrc
echo "###END_FUGUE_STATE_CONFIG###" >> ~/.zshrc
