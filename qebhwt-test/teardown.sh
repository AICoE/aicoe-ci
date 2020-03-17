#!/bin/bash
oc delete taskruns --all -n $1
oc delete pipelineresource --all -n $1
oc delete pipelinerun --all -n $1

oc delete -f open-issue.yaml -n $1
oc delete -f close-issue.yaml -n $1
oc delete -f task.yaml -n $1
oc delete -f pipeline.yaml -n $1
oc delete -f triggertemplate.yaml -n $1
oc delete -f triggerbinding.yaml -n $1
oc delete -f eventlistener.yaml -n $1
