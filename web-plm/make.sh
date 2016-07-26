#!/usr/bin/env bash

# -h | --help : flag to display the help
# -c | --clean : flag to delete binaries at the end of the script
# --no-cache : flag to build the docker image to generate the binaries using the option --no-cache
# -r | --repository <repository name> : the git repository to clone
# -b | --branch <branch name> : the branch of the repository to checkout
# -n | --name <docker image name> : the name of the resulting docker image
# -v | --version <docker image version> : the version of the resulting docker image

# read the options
TEMP=`getopt -o hcr:b:n:v: --long help,clean,no-cache,repository:branch:,name:,version: -n 'make.sh' -- "$@"`

if [ $? != 0 ] ; then
    echo "Terminating..."
    exit 1
fi

eval set -- "$TEMP"

ARG_REPOSITORY="github.com/BuggleInc/webplm.git"
ARG_BRANCH="master"
ARG_NAME="webplm"
ARG_VERSION=""
ARG_NO_CACHE=false
ARG_CLEAN=false

# One-liner to get the full directory name of the script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

usage() {
    echo "$0 [-h | --help] [-c | --clean] [--no-cache] [-r | --repository <repository name>] [-b | --branch <branch name>] [-n | --name <docker image name>] [-v | --version <version name>]"
}

while true ; do
    case "$1" in
        -h|--help)
            usage
            exit 0 ;;
        -c|--clean)
            ARG_CLEAN=true ; shift ;;
        --no-cache)
            ARG_NO_CACHE=true ; shift ;;
        -r|--repository)
            case "$2" in
                *) ARG_REPOSITORY=$2 ; shift 2 ;;
            esac ;;
        -b|--branch)
            case "$2" in
                *) ARG_BRANCH=$2 ; shift 2 ;;
            esac ;;
        -n|--name)
            case "$2" in
                *) ARG_NAME=$2 ; shift 2 ;;
            esac ;;
        -v|--version)
            case "$2" in
                *) ARG_VERSION="$2" ; shift 2 ;;
            esac ;;
        --) shift ; break ;;
        *) echo "Internal error!" ; exit 1 ;;
    esac
done

if [ -n "$ARG_VERSION" ]; then
    DOCKER_IMAGE_FULLNAME="$ARG_NAME:$ARG_VERSION"
else
    DOCKER_IMAGE_FULLNAME="$ARG_NAME"
fi

# TODO: Factorize this code
if [ "$ARG_NO_CACHE" = true ]; then
    docker build --build-arg "REPOSITORY=$ARG_REPOSITORY" \
                 --build-arg "BRANCH=$ARG_BRANCH" \
                 --no-cache \
                 -t play-webplm \
                 github.com/BuggleInc/plm-dockers.git#update:play
else
    docker build --build-arg "REPOSITORY=$ARG_REPOSITORY" \
                 --build-arg "BRANCH=$ARG_BRANCH" \
                 -t play-webplm \
                 github.com/BuggleInc/plm-dockers.git#update:play
fi

docker run -v ~/.ivy2:/root/.ivy2 \
           -v "$DIR/target:/app/target" \
           play-webplm stage

echo "Binaries of webPLM are available in $DIR/target/"

docker build -t "$DOCKER_IMAGE_FULLNAME" .

if [ "$ARG_CLEAN" = true ]; then
    echo "Deleting directory $DIR/target/..."
    # sudo is needed to clean since the generated binaries belong to the root user from the docker container
    # TODO: Find a workaround to not have to use sudo
    sudo rm -rf "$DIR/target"
    echo "$DIR/target/ deleted."
fi

echo "Docker image $DOCKER_IMAGE_FULLNAME has been successfully built."
