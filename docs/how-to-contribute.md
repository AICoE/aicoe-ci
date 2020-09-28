# How to contribute

Welcome contributors,<br>
Please free feel to contribute and help us in efforts to make aicoe-ci application more effective.

Pre-requisite:

- Basic understanding of Tekton pipeline and tasks.<br>
  Some useful link to get started with learning:

  - [Tekton Pipeline](https://github.com/tektoncd/pipeline)
  - [Tekton Triggers](https://github.com/tektoncd/triggers#tekton-triggers)
  - [Tekton Dashboard](https://github.com/tektoncd/dashboard)
  - [Openshift Pipeline](https://openshift.github.io/pipelines-docs/docs/0.10.5/index.html)

- OpenShift cluster v4.x or equivalent Kubernetes clusters.<br>
  Openshift v3.11 and equivalent can also be used, however based on that some task steps and version of pipeline, triggers are be changed.

AICoE-CI Components:

- Tasks:

  - All new tasks are to be added in the tasks directory.
  - Use the example-pr-checks.yaml for any new tests to be added for pull request checks
  - Any other tasks are welcome too.
  - Make sure to add new resource required for the tasks in the resource.yaml

- Pipeline:

  - New pipeline are to be added in the pipeline directory.

- Events:

  - Please create new events for eventlistener, along with the triggertemplate and triggerbindings.

# Want to step up an instance

AICoE-CI required either Tekton Pipeline and Trigger to be available in the cluster which can be installed either manually or via OpenShift-Pipeline-Operator .<br>
Choose based upon your requirements and cluster support. Pipeline and Trigger version is already pinned in the setup instruction.

- Setup Manually Tekton Pipeline and Tekton Trigger in cluster:<br>
  script available for manual setup: [tekton-setup](../setup-instance/tekton-setup.sh)

```
oc new-project tekton-pipelines
oc adm policy add-scc-to-user anyuid -z tekton-pipelines-controller
oc apply --filename https://storage.googleapis.com/tekton-releases/pipeline/previous/v0.11.3/release.notags.yaml
oc apply --filename https://storage.googleapis.com/tekton-releases/triggers/previous/v0.4.0/release.yaml
oc apply --filename https://github.com/tektoncd/dashboard/releases/download/v0.6.1.5/tekton-dashboard-release.yaml
oc expose svc/tekton-dashboard
```

- Use OpenShift-Pipeline controller:

  Please follow:

  - [Installation Guide](https://docs.openshift.com/container-platform/4.5/pipelines/installing-pipelines.html)
  - aicoe-ci requires v1.0.1 [openshift-pipeline-operator](https://docs.openshift.com/container-platform/4.5/pipelines/op-release-notes.html#op-release-notes-1-0_op-release-notes)

## Setup AICoE-CI instance

Kustomize can be used for deployment of the whole project:<br>
[instance-kustomization](../setup-instance/kustomization.yaml) can be used for setting up the application.<br>
`kustomize build --enable_alpha_plugins ../setup-instance/ | oc apply -f - -n <namespace>`

Pre-requisite before application deployment:

- Setting up secrets required by aicoe-ci:<br>
  update the secret manifest file [instance-secrets.yaml](../setup-instance/instance-secrets.yaml) with relevant secret keys and deploy all required secrets to the namespace.

_NOTE_: components can be searched/deleted by label app.<br>
`--selector 'app=aicoe-ci'`

### Behind VPN Setup:

#### Ultrahook

ultrahook passes the public internet request to services behind VPN

- ultrahook Deployment instance serves the redirect request to configured endpoint.<br>
  Deployment manifest is available, use the [manifest](../setup-instance/ultrahook.yaml), update the relevant field.<br>
  ULTRAHOOK_DESTINATION: service endpoint where ultrahook will redirect.

- Ultrahook secret is a requirement for the ultrahook deployment. secret manifest is available, use the [manifest](../setup-instance/ultrahook-secrets.yaml), update the relevant field.<br>
  ULTRAHOOK_API_KEY: Ultrahook api key which will refer to namespace. More Details on creating a ultrahook api key is instructed below.

#### Ultrahook Webhook Configuration

Register at <http://www.ultrahook.com>.<br>
you will choose webhook namespace and you will get API key. you need to provide your API key to the deployment. Then you need to choose a subdomain - so that you can use your namespace for multiple destinations. The generated webhook URL will then look like

```
http://<some_subdomain>.<namespace>.ultrahook.com
```

More Details: [AICoE/ultrahook](https://github.com/AICoE/ultrahook)
