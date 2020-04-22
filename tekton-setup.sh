oc new-project tekton-pipelines
oc adm policy add-scc-to-user anyuid -z tekton-pipelines-controller
oc apply --filename https://storage.googleapis.com/tekton-releases/pipeline/previous/v0.11.1/release.notags.yaml
oc apply --filename https://storage.googleapis.com/tekton-releases/triggers/previous/v0.4.0/release.yaml
oc apply --filename https://github.com/tektoncd/dashboard/releases/download/v0.6.0/tekton-dashboard-release.yaml
oc expose svc/tekton-dashboard
