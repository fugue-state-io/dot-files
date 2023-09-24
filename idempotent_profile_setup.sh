#/bin/bash
#Remove config so bootstrap.sh is idempotent
sed -i -e '/###BEGIN_FUGUE_STATE_CONFIG###/,/###END_FUGUE_STATE_CONFIG###/d' ~/.bashrc
#Add config from append.rc
echo "###BEGIN_FUGUE_STATE_CONFIG###" >> ~/.bashrc
envsubst '$DOT_FILES' < $DOT_FILES/rc_files/append.rc >> ~/.bashrc
echo "###END_FUGUE_STATE_CONFIG###" >> ~/.bashrc