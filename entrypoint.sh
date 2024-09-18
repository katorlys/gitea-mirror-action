#!/bin/bash

set -e

echo ">> Setting Up Script... <<"

git clone https://github.com/katorlys/github-mirror-gitea.git

cd github-mirror-gitea

export GITHUB_PAT=${GITHUB_PAT}
export GITEA_PAT=${GITEA_PAT}
export GITEA_HOST=${GITEA_HOST}
export GITEA_USERNAME=${GITEA_USERNAME}
export GITHUB_USERNAME=${GITHUB_USERNAME}
export CREATE_ORG=${CREATE_ORG}
export REMOVE_INEXIST_REPO=${REMOVE_INEXIST_REPO}
export REMOVE_EXISTING_REPO=${REMOVE_EXISTING_REPO}
export MIRROR_OWNED=${MIRROR_OWNED}
export MIRROR_FORKED=${MIRROR_FORKED}
export MIRROR_STARED=${MIRROR_STARED}
export MIRROR_COLLABORATOR=${MIRROR_COLLABORATOR}
export MIRROR_ORGANIZATION=${MIRROR_ORGANIZATION}
export REPO_RULE=${MODE}
export REPO_NAME=${REGEX}

pip3 install -r requirements.txt

echo ">> Mirror Repositories... <<"
python3 main.py