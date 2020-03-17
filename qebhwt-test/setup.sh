#!/bin/bash
oc apply -f resource.yaml -n $1
oc apply -f close-issue.yaml -n $1
oc apply -f open-issue.yaml -n $1
oc apply -f task.yaml -n $1
oc apply -f pipeline.yaml -n $1
oc apply -f triggertemplate.yaml -n $1
oc apply -f triggerbinding.yaml -n $1
oc apply -f eventlistener.yaml -n $1
