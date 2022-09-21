#!/usr/bin/env bash
set -x

rm -rf charts/*

charts="$(jq -r 'keys[]' < repos.json)"
for name in $charts;
do
  url="$(jq -r ".[\"$name\"]" < ./repos.json)"
  dir="./charts/$name"
  git clone "$url" "$dir"
  rm -rf "$dir/.gitignore" "$dir/.git"
done

helm package ./charts/*
helm repo index --url https://huuff.github.io/helm-charts --merge ./index.yaml .
