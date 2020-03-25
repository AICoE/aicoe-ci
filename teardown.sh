#!/bin/bash
oc delete taskruns --all -n $1
oc delete pipelineresource --all -n $1
oc delete pipelinerun --all -n $1

oc delete -f tasks/open-issue.yaml -n $1
oc delete -f tasks/close-issue.yaml -n $1
oc delete -f tasks/task.yaml -n $1
oc delete -f pipeline/pipeline.yaml -n $1
oc delete -f pipeline/triggertemplate.yaml -n $1
oc delete -f pipeline/triggerbinding.yaml -n $1
oc delete -f pipeline/eventlistener.yaml -n $1
