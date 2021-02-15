#!/bin/bash

helm repo add center https://repo.chartcenter.io

kubectl create namespace artifactory

export MASTER_KEY=$(openssl rand -hex 32)
echo "MASTER_KEY: ${MASTER_KEY}"

export JOIN_KEY=$(openssl rand -hex 32)
echo "JOIN_KEY: ${JOIN_KEY}"

kubectl create secret generic my-masterkey-secret -n artifactory --from-literal=master-key=${MASTER_KEY}

kubectl create secret generic my-joinkey-secret -n artifactory --from-literal=join-key=${JOIN_KEY}

