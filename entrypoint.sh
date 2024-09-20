#!/bin/bash

set -e

echo ">> Setting Up Script... <<"

git clone https://github.com/katorlys/github-mirror-gitea.git

cd github-mirror-gitea

if [ -n "${GITHUB_USERNAME}" ]; then
    export GITHUB_USERNAME=${GITHUB_USERNAME}
else
    echo ">> Error: You have to set your GitHub username <<"
    exit 1
fi

if [ -n "${GITHUB_PAT}" ]; then
    export GITHUB_PAT=${GITHUB_PAT}
else
    echo ">> Error: You have to set your GitHub personal access token <<"
    exit 1
fi

if [ -n "${GITEA_USERNAME}" ]; then
    export GITEA_USERNAME=${GITEA_USERNAME}
else
    echo ">> Error: You have to set your Gitea username <<"
    exit 1
fi

if [ -n "${GITEA_HOST}" ]; then
    export GITEA_HOST=${GITEA_HOST}
else
    echo ">> Error: You have to set your Gitea hostname <<"
    exit 1
fi

if [ -n "${GITEA_PAT}" ]; then
    export GITEA_PAT=${GITEA_PAT}
else
    echo ">> Error: You have to set your Gitea personal access token <<"
    exit 1
fi

export CREATE_ORG=${CREATE_ORG}
export REMOVE_INEXIST_REPO=${REMOVE_INEXIST_REPO}
export REMOVE_EXISTING_REPO=${REMOVE_EXISTING_REPO}
export MIRROR_OWNED=${MIRROR_OWNED}
export MIRROR_PRIVATE=${MIRROR_PRIVATE}
export MIRROR_FORKED=${MIRROR_FORKED}
export MIRROR_STARRED=${MIRROR_STARRED}
export MIRROR_COLLABORATOR=${MIRROR_COLLABORATOR}
export MIRROR_ORGANIZATION=${MIRROR_ORGANIZATION}
export REPO_RULE=${MODE}
export REPO_NAME=${REGEX}

pip3 install -r requirements.txt

echo ">> Mirror Repositories... <<"
python3 main.py