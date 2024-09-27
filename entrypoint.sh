#!/bin/bash

set -e

echo ">> Setting Up Script... <<"

git clone https://github.com/katorlys/github-mirror-gitea.git

cd github-mirror-gitea

if [ -n "${INPUT_GITHUB_USERNAME}" ]; then
    export GITHUB_USERNAME=${INPUT_GITHUB_USERNAME}
else
    echo ">> Error: You have to set your GitHub username <<"
    exit 1
fi

if [ -n "${INPUT_GITHUB_PAT}" ]; then
    export GITHUB_PAT=${INPUT_GITHUB_PAT}
else
    echo ">> Error: You have to set your GitHub personal access token <<"
    exit 1
fi

if [ -n "${INPUT_GITEA_USERNAME}" ]; then
    export GITEA_USERNAME=${INPUT_GITEA_USERNAME}
else
    echo ">> Error: You have to set your Gitea username <<"
    exit 1
fi

if [ -n "${INPUT_GITEA_HOST}" ]; then
    export GITEA_HOST=${INPUT_GITEA_HOST}
else
    echo ">> Error: You have to set your Gitea hostname <<"
    exit 1
fi

if [ -n "${INPUT_GITEA_PAT}" ]; then
    export GITEA_PAT=${INPUT_GITEA_PAT}
else
    echo ">> Error: You have to set your Gitea personal access token <<"
    exit 1
fi

export CREATE_ORG=${INPUT_CREATE_ORG}
export REMOVE_INEXIST_REPO=${INPUT_REMOVE_INEXIST_REPO}
export REMOVE_EXISTING_REPO=${INPUT_REMOVE_EXISTING_REPO}
export MIRROR_OWNED=${INPUT_MIRROR_OWNED}
export MIRROR_PRIVATE=${INPUT_MIRROR_PRIVATE}
export MIRROR_FORKED=${INPUT_MIRROR_FORKED}
export MIRROR_STARRED=${INPUT_MIRROR_STARRED}
export MIRROR_COLLABORATOR=${INPUT_MIRROR_COLLABORATOR}
export MIRROR_ORGANIZATION=${INPUT_MIRROR_ORGANIZATION}
export REPO_RULE=${INPUT_MODE}
export REPO_NAME=${INPUT_REGEX}

pip3 install -r requirements.txt

echo ">> Mirror Repositories... <<"
python3 main.py