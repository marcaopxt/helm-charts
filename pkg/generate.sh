#!/bin/bash

helm package --version 3.1.8-rev2 ../charts/jenkins-helm-charts/charts/jenkins/  -d mapx/
helm repo index mapx/ --url https://github.com/marcaopxt/helm-charts/master/pkg/
