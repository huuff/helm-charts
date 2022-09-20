#!/usr/bin/env bash

# TODO: Store only the git repos somewhere, and clone them on each build

helm package ./charts/*
helm repo index --url https://github.com/huuff/helm-charts --merge ./index.yaml .
