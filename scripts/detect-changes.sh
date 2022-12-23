#!/usr/bin/env bash

repos=()
matrix="{\"repos\":[]}"

if [ "$terraform_changed" == "true" ]; then

    echo "terraform source code changed. all repos will be updated."
    repos_path=($(ls -d repos/*/))
    for repo_path in "${repos_path[@]}"; do
        repo_path=${repo_path#*/}
        repo_name=${repo_path%/*}
        repos+=("$repo_name")
    done

elif [ "$repos_modified" == "true" ]; then

    # at least one repo modified
    echo "tfvars changed for the next repos:"

    files=$(echo "$repos_files")
    for file in $files; do
        repo_path=${file#*/}
        repo_name=${repo_path%/*}
        repos+=("$repo_name")
    done

    # filtering unique repos
    repos=($(echo "${repos[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))

fi

if [ "$terraform_changed" == "false" ] && [ "$repos_modified" == "false" ]; then
    # no repo modified neither terraform
    echo "::set-output name=repos_modified::none"
else
    for repo in "${repos[@]}"; do
        matrix=$( echo $matrix | jq -c --arg repo "$repo" '.repos += [$repo]')
    done

    echo "matrix:"
    echo $matrix | jq .
    echo "::set-output name=repos_modified::$matrix"
fi