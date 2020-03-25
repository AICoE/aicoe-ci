#!/bin/bash
oc apply -f tasks/resource.yaml -n $1
oc apply -f tasks/close-issue.yaml -n $1
oc apply -f tasks/open-issue.yaml -n $1
oc apply -f tasks/task.yaml -n $1
oc apply -f pipeline/pipeline.yaml -n $1
oc apply -f pipeline/triggertemplate.yaml -n $1
oc apply -f pipeline/triggerbinding.yaml -n $1
oc apply -f pipeline/eventlistener.yaml -n $1
