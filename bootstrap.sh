#/bin/bash
export BOOTSTRAP_PATH=$(realpath "$0")
export DOT_FILES=$(dirname $BOOTSTRAP_PATH)

mkdir -p $DOT_FILES/.workspace/
cp ~/.bashrc $DOT_FILES/.workspace/.bashrc

NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#Remove config so bootstrap.sh is idempotent
sed -i -e '/###BEGIN_FUGUE_STATE_CONFIG###/,/###END_FUGUE_STATE_CONFIG###/d' ~/.bashrc
#Add config from append.rc
echo "###BEGIN_FUGUE_STATE_CONFIG###" >> ~/.bashrc
envsubst '$DOT_FILES' < $DOT_FILES/rc_files/append.rc >> ~/.bashrc
echo "###END_FUGUE_STATE_CONFIG###" >> ~/.bashrc

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew update
brew bundle --file=$DOT_FILES/deps/Brewfile

$DOT_FILES/git/git_setup.sh