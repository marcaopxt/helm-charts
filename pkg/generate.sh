#!/bin/bash

helm package --version 3.1.8-rev4 ../charts/jenkins-helm-charts/charts/jenkins/  -d mapx/
helm repo index mapx/ --url https://raw.githubusercontent.com/marcaopxt/helm-charts/master/pkg/mapx

