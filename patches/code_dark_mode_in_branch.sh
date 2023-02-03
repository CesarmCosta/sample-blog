#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ -z $1 ]]; then
  feature_branch_name="feature-${feature_name}"
else
  feature_branch_name="$1"
fi

current_branch=`git branch`
echo "Current Branch: $current_branch"

feature_branch_result=`git branch --list ${feature_branch_name}`
if  [[ -z $feature_branch_exists ]]; then
  echo "Creating new feature branch: ${feature_branch_name}"
  git checkout -b ${feature_branch_name}
else
  echo "Feature branch '${feature_branch_name}' already exists, please delete it before trying again..."
  exit 2
fi

$DIR/apply_patch_set.sh $feature_name