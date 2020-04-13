# Thoth-CI

Thoth-CI project uses components of TektonCD to provide custom CI/CD for AICoE.

## How to contribute

We welcome contributions, The following components can be worked on:

- Tasks:

  - All new tasks are to be added in the tasks directory.
  - Use the example-pr-checks.yaml for any new tests to be added for pull request checks
  - Any other tasks are welcome too.
  - Make sure to add new resource required for the tasks in the resource.yaml

- Pipeline:

  - New pipeline are to be added in the pipeline directory.

- Events:

  - Please create new events for eventlistener, along with the triggertemplate and triggerbindings.

## Want to step up an instance

- Setup Tekton Pipeline and Tekton Trigger in cluster.

- If behind the VPN, one time setup components:

  - Ultrahook: ultrahook passes the public internet request to services behind VPN

    - ultrahook secret and deployment with destination as Thoth-CI listener

- Setup other components required:

  ```bash
  oc apply -f custom-role/serviceaccount.yaml
  oc apply -f custom-role/role.yaml
  oc apply -f custom-role/binding.yaml
  ```

- Setup the CI/CD Pipeline

  Tasks and Pipeline Resource

  ```bash
  oc apply -f tasks/resource.yaml

  # Few tasks already contributed:
  oc apply -f tasks/close-issue.yaml
  oc apply -f tasks/open-issue.yaml
  oc apply -f tasks/coala-checks.yaml
  oc apply -f tasks/pytest-checks.yaml
  oc apply -f tasks/pr-build.yaml
  ```

  Pipeline

  ```bash
  oc apply -f pipeline/pipeline.yaml
  oc apply -f pipeline/triggertemplate.yaml
  oc apply -f pipeline/triggerbinding.yaml
  oc apply -f pipeline/eventlistener.yaml
  ```

Or all in one with `kustomize build . | oc --namespace ... -f -`

_NOTE_: components can be searched/deleted by label app.<br>
`--selector 'app=thoth-ci'`
