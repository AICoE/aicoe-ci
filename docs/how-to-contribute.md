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

- Setup Manually Tekton Pipeline and Tekton Trigger in cluster:

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
Creating the application<br>
`kustomize build --enable_alpha_plugins . | oc apply -f - -n <namespace>`

Some of the changes are needed to be done before deployment:

- Setting up secrets required by aicoe-ci:

-

_NOTE_: components can be searched/deleted by label app.<br>
`--selector 'app=aicoe-ci'`

### Behind VPN Setup:

#### Ultrahook

ultrahook passes the public internet request to services behind VPN

- Deployment manifest is available in [manifest](manifests/ultrahook.yaml).<br>
  If manually deploying, use the [manifest](manifests/ultrahook.yaml).<br>
  Deploying with kustomize file of aicoe-ci, already has the inclusion.
- Ultrahook secret is a requirement for the deployment.

  ```
  oc process -f openshift/ultrahook.secret.yaml ULTRAHOOK_API_KEY=`echo -n "<your_api_key>" | base64` | oc apply -f -
  ```

#### Ultrahook Webhook Configuration

Register at <http://www.ultrahook.com>.<br>
you will choose webhook namespace and you will get API key. you need to provide your API key to the deployment. Then you need to choose a subdomain - so that you can use your namespace for multiple destinations. The generated webhook URL will then look like

```
http://<some_subdomain>.<namespace>.ultrahook.com
```

More Details: [AICoE/ultrahook](https://github.com/AICoE/ultrahook)
