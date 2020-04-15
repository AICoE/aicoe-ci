oc new-project tekton-pipelines
oc adm policy add-scc-to-user anyuid -z tekton-pipelines-controller
oc apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.notags.yaml
oc apply --filename https://storage.googleapis.com/tekton-releases/triggers/latest/release.yaml
oc apply --filename https://github.com/tektoncd/dashboard/releases/download/v0.5.2/tekton-dashboard-release.yaml
oc expose svc/tekton-dashboard
