# Thoth-CI

## Running Tekton on OpenShift 3.11

-

## Running Tekton on OpenShift 4.3

-


## General

### PipelineRun/TaskRun exclusion

Both Kinds should be excluded from ArgoCD, so that the Application is not rendered as 'out of sync' just because instances
of PipelineRun exists on OpenShift.
