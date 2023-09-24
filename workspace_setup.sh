#/bin/bash
export BOOTSTRAP_PATH=$(realpath "$0")
export DOT_FILES=$(dirname $BOOTSTRAP_PATH)

mkdir -p $DOT_FILES/.workspace/
cp ~/.bashrc $DOT_FILES/.workspace/.bashrc

NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew update
brew bundle --file=$DOT_FILES/deps/Brewfile

$DOT_FILES/git/git_setup.sh
bash
$DOT_FILES/doctl/doctl_setup.sh

cd $DOT_FILES/../
git clone https://github.com/fugue-state-io/helm-charts.git
git clone https://github.com/fugue-state-io/terraform.git
git clone https://github.com/fugue-state-io/documentation.git
git clone https://github.com/fugue-state-io/fugue-state-ui.git