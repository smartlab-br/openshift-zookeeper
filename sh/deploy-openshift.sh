#!/bin/bash

echo 'creating project...'
oc new-project zk --description="MPT Zookeeper Cluster" --display-name="Apache Zookeeper"
oc create serviceaccount zksvcacct
oc adm policy add-scc-to-user anyuid -z zksvcacct -n zk

echo 'persitent volumes claining...'
oc create -f yaml/volume-persistent-clain.yaml 

echo 'deploying zookeeper...'
oc create -f yaml/deploy-zookeeper.yaml

echo 'creating routes...'
oc create -f yaml/route.yaml
