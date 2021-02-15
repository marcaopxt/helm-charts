#!/bin/bash

mkdir -p pkg/jenkins

helm package --version 3.1.8-rev4 charts/jenkins-helm-charts/charts/jenkins/  -d pkg/jenkins/
helm repo index pkg/jenkins/ --url https://raw.githubusercontent.com/marcaopxt/helm-charts/master/pkg/jenkins

mkdir -p pkg/kafdrop

helm package --version 3.1.8-rev4 charts/kafdrop/  -d pkg/kafdrop
helm repo index pkg/kafdrop/ --url https://raw.githubusercontent.com/marcaopxt/helm-charts/master/pkg/kafdrop

