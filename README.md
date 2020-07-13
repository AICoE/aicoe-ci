# AICoE-CI

AICoE-CI is a continuous integration and delivery system based tekton-pipeline/openshift-pipeline.<br>
It is available as [github application](https://github.com/apps/aicoe-ci)

## Instructions to setup Bots and Ci services

- Requirement:

  - The Bots and CI Services uses authorization credentials of our cyborg team member [sesheta](https://github.com/sesheta).Please extend a invitation for [sesheta](https://github.com/sesheta) to be a member of organization or a collaborator in the repository for which the bots and CI system is being setup.

- Services:

  - [AICoE-CI](https://github.com/AICoE/aicoe-ci): Continuous integration system is used for running status checks on pull request, build releases, and python module releases.<br>
    Setup information:

    - AICoE-CI is available as [GitHub application](https://github.com/apps/aicoe-ci).<br>
      It can be configured on an organization or on a single repository.

  - [Kebechet](https://github.com/thoth-station/kebechet#kebechet): Kebechet is a SourceOps bot that automates updating dependencies of your project.<br>
    Setup information:

    - Kebechet is available as [GitHub application](https://github.com/apps/khebhut).<br>
      It can be configured on an organization or on a single repository.
    - Kebechet requires a configuration file ([.thoth.yaml](https://github.com/thoth-station/kebechet/blob/master/.thoth.yaml)) at root level of the project.

      ```yaml
      host: khemenu.thoth-station.ninja
      tls_verify: false
      requirements_format: pipenv

      runtime_environments:
        - name: rhel:8
          operating_system:
            name: rhel
            version: "8"
          python_version: "3.6"
          recommendation_type: latest

      managers:
        - name: pipfile-requirements
        - name: update
          configuration:
            labels: [bot]
        - name: info
        - name: version
          configuration:
            maintainers:
              - goern   # Update this list of project maintainers
              - fridex
            assignees:
              - sesheta
            labels: [bot]
            changelog_file: true
      ```

  - [Sefkhet-Abwy](https://github.com/AICoE/Sefkhet-Abwy#sefkhet-abwy): SourceOps bot functions as review manager, sets up labels in pull request and issues, manage chat notifications, and prometheus chat notification.<br>
    Setup information:

    - Sefkhet-Abwy is available as a [GitHub application](https://github.com/apps/sefkhet-abwy).

  - [Thoth-zuul](https://github.com/thoth-station/zuul-config#zuul-config): Thoth Zuul function as CI, it runs status check, merges pull request based on approvals, execute release functionality for python modules.<br>
    _Note_: Thoth Zuul is replaced by aicoe-ci with additional features. Only merge capability is lacking in aicoe-ci.<br>
    _Disclaimer_: This is would be soon retired.<br>
    Setup information:

    - Thoth-zuul is available as a [GitHub application](https://github.com/apps/thoth-zuul).

    - Add a `.zuul.yaml` file with following content with appropriate values. Zuul uses this yaml file to setup the Configuration required for the Repository

    ```
    - project:
        check:
          jobs:
            - thoth-coala
            - thoth-pytest
        gate:
          jobs:
            - "thoth-coala"
        post:
          jobs:
            - "trigger-build":
                vars:
                  cluster: ""
                  namespace: ""
                  buildConfigName: ""
        kebechet-auto-gate:
          jobs:
            - thoth-coala
    ```

    - Add a '.coafile' file with following content.Modify it as per requirement, coafile file would be used for configuration on coala test run.

    ```
    [all]
    bears = LineCountBear, FilenameBear
    files = **.py, **.yaml, **.toml, **.rst, **.md
    file_naming_convention = snake
    ignore = **/__pycache__/**, **/__pycache__, __pycache__, __pycache__/**, **/*.pyc, *.pyc, .github/**/*.md, test/**
    max_line_length = 120
    max_lines_per_file = 2000

    [all.python]
    bears = PycodestyleBear, PyDocStyleBear
    files = **.py
    language = Python
    editor = vim
    ignore = setup.py, tests/**,docs/source/conf.py

    [zuul.yaml]
    bears = YAMLLintBear
    files = .zuul.yaml
    max_line_length = 180
    ```

    - Add the configuration to [zuul-config](https://github.com/thoth-station/zuul-config) repo, add a config file in the following format and named as the Repository name in [zuul-config/zuul](https://github.com/thoth-station/zuul-config/tree/master/zuul)

    ```
    ---
    - tenant:
        name: 'local'
        source:
          github.com:
            untrusted-projects:
              - my-project-repo-name
    ```

## Services and Features

- Status Check on Pull request for testing and containerization.

  - `aicoe-ci/pre-commit-check` execute [pre-commit](https://pre-commit.com/) checks based on [pre-commit-config.yaml](.pre-commit-config.yaml).
  - `aicoe-ci/pytest-check` executes run python test.
  - `aicoe-ci/coala-check` executes [coala](https://coala.io/#/home) linting checks based on [.coafile]() (**Deprecated**)
  - `aicoe-ci/build-check` execute container image build check.<br>
    Supports source-to-image, Dockerfile, Containerfile based image. (Default `source-to-image`, if Dockerfile or Containerfile are not present)

- Building Container image on Tag release and for Pull request.

  - On Tag release, the pipeline would build the image based upon the tag and release to [quay.io](https://quay.io/).
  - Pull request based image can be build by commenting `/deploy` on the pull-request comment to release the image to [quay.io](https://quay.io/).

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

```
oc new-project tekton-pipelines
oc adm policy add-scc-to-user anyuid -z tekton-pipelines-controller
oc apply --filename https://storage.googleapis.com/tekton-releases/pipeline/previous/v0.11.3/release.notags.yaml
oc apply --filename https://storage.googleapis.com/tekton-releases/triggers/previous/v0.4.0/release.yaml
oc apply --filename https://github.com/tektoncd/dashboard/releases/download/v0.6.1.5/tekton-dashboard-release.yaml
oc expose svc/tekton-dashboard
```

- If behind the VPN, one time setup components:

  - Ultrahook: ultrahook passes the public internet request to services behind VPN

    - ultrahook secret and deployment with destination as Thoth-CI listener

Create the application with `kustomize build . | oc --namespace ... -f -`

_NOTE_: components can be searched/deleted by label app.<br>
`--selector 'app=thoth-ci'`
