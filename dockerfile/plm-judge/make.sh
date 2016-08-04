#!/usr/bin/env bash

# -h | --help : flag to display the help
# -c | --clean : flag to delete binaries at the end of the script
# --no-cache : flag to build the docker image to generate the binaries using the option --no-cache
# -r | --repository <repository name> : the git repository to clone
# -b | --branch <branch name> : the branch of the repository to checkout
# --bin <path to binaries> : the path to the binaries of webPLM if you already have them
# -n | --name <docker image name> : the name of the resulting docker image
# -v | --version <docker image version> : the version of the resulting docker image


usage() {
    echo "$0 [-h | --help] [-c | --clean] [--no-cache] [-r | --repository <repository name>] [-b | --branch <branch name>] [--bin <path to binaries>] [-n | --name <docker image name>] [-v | --version <version name>]"
}

terminating() {
    echo "Terminating..."
    exit 1

}
# read the options
TEMP=`getopt -o hcr:b:n:v: --long help,clean,no-cache,repository:branch:,bin:,name:,version: -n 'make.sh' -- "$@"`

if [ $? != 0 ] ; then
    terminating
fi

eval set -- "$TEMP"

ARG_REPOSITORY="github.com/BuggleInc/PLM-judge.git"
ARG_BRANCH="master"
ARG_NAME="plm-judge"
ARG_VERSION=""
ARG_NO_CACHE=false
ARG_CLEAN=false
ARG_BIN=""

# One-liner to get the full directory name of the script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

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
        --bin)
            case "$2" in
                *) ARG_BIN=$2 ; shift 2 ;;
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

if [ -n "$ARG_BIN" ]; then

    # We already have the binaries
    cp -r "$ARG_BIN" "$DIR/"

    if [ $? -eq 1 ]; then
        echo "An error occurred while copying the binaries."
        terminating
    fi

else

    echo "Generating docker image to build the project available here: $ARG_REPOSITORY"
    echo "The current branch is $ARG_BRANCH"

    docker build --build-arg "REPOSITORY=$ARG_REPOSITORY" \
                 --build-arg "BRANCH=$ARG_BRANCH" \
                 "--no-cache=$ARG_NO_CACHE" \
                 -t play-judge \
                 github.com/BuggleInc/plm-dockers.git#update:dockerfile/play

    if [ $? -eq 1 ]; then
        echo "An error occurred while generating the docker image to build the project."
        terminating
    fi

    docker run -v ~/.ivy2:/root/.ivy2 \
               -v "$DIR/target:/app/target" \
               --rm play-judge assembly

    if [ $? -eq 1 ]; then
        echo "An error occurred while building the project."
        terminating
    fi

fi

echo "Binaries of PLM-judge are available in $DIR/target/"

docker build -t "$DOCKER_IMAGE_FULLNAME" .

if [ $? -eq 1 ]; then
    echo "An error occurred while generating the docker image to run the project."
    terminating
fi

if [ "$ARG_CLEAN" = true ]; then
    echo "Deleting directory $DIR/target/..."
    # sudo is needed to clean since the generated binaries belong to the root user from the docker container
    # TODO: Find a workaround to not have to use sudo
    sudo rm -rf "$DIR/target"
    echo "$DIR/target/ deleted."
fi

echo "Docker image $DOCKER_IMAGE_FULLNAME has been successfully built."
