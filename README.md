# Thoth-CI

Thoth-CI project uses components of TektonCD to provide custom CI/CD for AICoE.

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
  oc apply -f tasks/close-issue.yaml
  oc apply -f tasks/open-issue.yaml
  oc apply -f tasks/task.yaml
  ```

  Pipeline

  ```bash
  oc apply -f pipeline/pipeline.yaml
  oc apply -f pipeline/triggertemplate.yaml
  oc apply -f pipeline/triggerbinding.yaml
  oc apply -f pipeline/eventlistener.yaml
  ```
