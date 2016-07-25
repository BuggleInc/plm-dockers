#!/usr/bin/env bash

# -b <branch name>, --branch=<branch name> : the branch of the repository to checkout
# -n <image name>, --name=<image name> : the name of the resulting docker image
# -v <version>, --version=<version> : the version of the resulting docker image

# read the options
TEMP=`getopt -o hb:n:v: --long help,branch:,name:,version: -n 'make.sh' -- "$@"`

if [ $? != 0 ] ; then
    echo "Terminating..."
    exit 1
fi

eval set -- "$TEMP"

ARG_BRANCH="master"
ARG_NAME="webplm"
ARG_VERSION=""

usage() {
    echo "$0 [-h | --help] [-b | --branch <branch name>] [-n | --name <docker image name>] [-v | --version <version name>]"
}

while true ; do
    case "$1" in
        -h|--help)
            usage
            exit 0 ;;
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
                *) ARG_VERSION=":$2" ; shift 2 ;;
            esac ;;
        --) shift ; break ;;
        *) echo "Internal error!" ; exit 1 ;;
    esac
done

docker build --build-arg "BRANCH=$ARG_BRANCH" \
             --build-arg "REPOSITORY=github.com/BuggleInc/webplm.git" \
             -t play-webplm \
             github.com/BuggleInc/plm-dockers.git#update:play

docker run -v ~/.ivy2:/root/.ivy2 \
           -v `pwd`/target:/app/target \
           play-webplm stage

docker build -t "$ARG_NAME$ARG_VERSION" .
