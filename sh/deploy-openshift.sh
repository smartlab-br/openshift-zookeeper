#!/bin/bash

echo 'creating project...'
oc new-project zk --description="MPT Zookeeper Cluster" --display-name="Zookeeper"
oc adm policy add-scc-to-user anyuid -n zk -z default
#oc create serviceaccount zksvcacct
#oc adm policy add-scc-to-user anyuid -z zksvcacct -n zk

echo 'persitent volumes claining...'
#oc create -f yaml/volume-persistent-clain-mpt.yaml 

echo 'deploying zookeeper...'
oc create -f yaml/deploy-zookeeper.yaml

echo 'creating services...'
oc create -f yaml/service.yaml
