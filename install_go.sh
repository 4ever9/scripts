
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

function print_blue() {
  printf "${BLUE}%s${NC}\n" "$1"
}

function printHelp() {
  print_blue "Usage:  "
  echo "  install_go.sh <version>"
  echo "    <version> - golang version"
  echo "  install_go.sh -h (print this message)"
}

VERSION=$1

if [ -z $VERSION ]; then
	printHelp
	exit 1
fi

if [ $VERSION == "-h" ]; then
	printHelp
	exit 0
fi

print_blue "===> Downloading go${VERSION}.linux-amd64.tar.gz"
if [ ! -f go${VERSION}.linux-amd64.tar.gz ]; then
	wget https://golang.org/dl/go${VERSION}.linux-amd64.tar.gz
fi

print_blue "===> Unpacking go${VERSION}.linux-amd64.tar.gz"
if [ ! -d /usr/local/go ]; then
	tar -C /usr/local -xzf go${VERSION}.linux-amd64.tar.gz
fi

print_blue "===> Adding the following lines to your profile(~/.bashrc, ~/.zshrc, etc)."
print_blue "===> Don't forget to apply the changes immediately, just run the shell commands directly or execute them from the profile using a command such as source $HOME/.profile."
printf "	export GOROOT=/usr/local/go\n"
printf "	export PATH=\$PATH:\$GOROOT/bin\n"
