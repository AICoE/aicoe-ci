# AICoE-CI

AICoE-CI is a continuous integration and delivery system based on Tekton-Pipeline/OpenShift-Pipeline.

AICoE-CI is developed with Tekton Pipeline concepts.Pipeline are triggered with Tekton Triggers which functions based on git webhook events.<br>
On the webhook triggered events, different pipeline are triggered to provide different services based on Pull Request, Issues and Tag releases.

## Architecture

![aicoe-ci architecture](/docs/arch.png)

### Services and Features

- Status Check on Pull request for testing and containerization.

  - `aicoe-ci/pre-commit-check` execute [pre-commit](https://pre-commit.com/) checks based on [pre-commit-config.yaml](.pre-commit-config.yaml).
  - `aicoe-ci/pytest-check` executes run python test.
  - `aicoe-ci/coala-check` executes [coala](https://coala.io/#/home) linting checks based on [.coafile]() (**Deprecated**)
  - `aicoe-ci/build-check` execute container image build check.<br>
    Supports source-to-image, Dockerfile, Containerfile based image. (Default `source-to-image`, if Dockerfile or Containerfile are not present)

- Building Container image on Tag release and for Pull request.

  - On Tag release, the pipeline would build the image based upon the tag and release to [quay.io](https://quay.io/).
  - Pull request based image can be build by commenting `/deploy` on the pull-request comment to release the image to [quay.io](https://quay.io/).

#### GitHub ChatOps Options:

AICoE-CI provides some GitHub comment commands for pull request processing on GitHub.<br>
Developers can comment following commands on Github pull request.

- `/retest`
- `/deploy`

All the Pull Request status checks can be rerun by the following command.<br>
command: `/retest`

In a Development environment, if the application is setup with image registry in the aicoe-ci configuration file. Then with the following command, aicoe-ci can assist with building an image out of the pull request and pushing the image to configured image registry.<br>
command: `/deploy`

### Architectural decisions

We keep track of architectural decisions using lightweight architectural decision records. More information on the used format is available at <https://adr.github.io/madr/>. General information about architectural decision records is available at <https://adr.github.io/> .

Architectural decisions

- [ADR-0000](docs/adr/0000-use-markdown-architectural-decision-records.md) - Use Markdown Architectural Decision Records
- [ADR-0001](docs/adr/0001-use-gpl3-as-license.md) - Use GNU GPL as license

## Getting Started

### Setting AICoE-CI on GitHub Organization/Repository

Setting up AICoE-CI on to your Github Organization/Repository can be commenced with three simple steps process:

- AICoE-CI is available as [github application](https://github.com/apps/aicoe-ci).<br>
  Install and configure the app on your GitHub Organization or Repository.

- Send invite to our friendly cyborg bot as a Contributor: [Sesheta](https://github.com/sesheta)

- Add the aicoe-ci configuration file into your repository/repositories.<br>
  Example configuration file: [.aicoe-ci.yaml](docs/.aicoe-ci.yaml)<br>
  More Detailed Explanation on aicoe-ci configuration file: [aicoe-ci configuration file](#aicoe-ci-configuration-file)

**NOTE**: Interested in Other Thoth-bots, AICoE-CI works very well with other bots. More information on Setup of other Thoth Bots: [Thoth Bots Setup](docs/thoth-bots-setup.md)

### AICoE-CI configuration file

The AICoE-CI configuration file is to be added to the root of the repository directory and to be named: `.aicoe-ci.yaml`<br>
It allows the user to configure checks, release modules to pypi, build preferences and update imagestream in kustomize yaml file.

#### Configuring checks and tests

CI provides following checks for pull requests.Each check is independent of each other, so users can pick and choose the tests which they require for there repository. It can be added into the `.aicoe.yaml` configuration file, as shown in the example snippet below.

```yaml
check:
  - thoth-pytest
  - thoth-pytest-py38
  - thoth-precommit
  - thoth-precommit-py38
  - thoth-build
  - thoth-custom-build
```

More information on available checks/tests:

- `thoth-pytest`: executes python-3.6 pytest.
- `thoth-pytest-py38`: executes python-3.8 pytest.
- `thoth-precommit`: execute [pre-commit](https://pre-commit.com/) checks based on [pre-commit-config.yaml](.pre-commit-config.yaml).
- `thoth-precommit-py38`: execute [pre-commit](https://pre-commit.com/) checks based on [pre-commit-config.yaml](.pre-commit-config.yaml) available for python-3.8.
- `thoth-build`: execute container image build check. more information on configuring image build requirements: [here](#configuring-build-requirements).
- `thoth-custom-build`: execute custom pipeline available in the users repository.

If users require more custom checks/tests, please open a feature request issue with detailed explanation of the tests requirement.

#### Configuring Build requirements

Configuration files allows user assign details about the build requirements and specify base image and registry details for build and push.

```yaml
build:
  build-stratergy: Dockerfile # Allowed values: Source, Dockerfile, Containerfile (default: Source)
  base-image: registry.access.redhat.com/ubi8/ubi:latest
  dockerfile-path: Dockerfile
  registry: quay.io # Imgage registry to be used. (default: quay.io)
  registry-org: thoth-station # Organization to be used in Image Registry. (default: thoth-station)
  registry-project: example # Project Repository in Image Registry to be used to push image.
  registry-secret: thoth-station-thoth-pusher-secret # pre-exists in ci
```

- `registry-secret` are to be pre setup and would be available for AICoE in running aicoe-ci instance.

Quay Organization | Secret value
----------------- | ----------------------------------
AICoE             | aicoe-pusher-secret
Thoth-Station     | thoth-station-thoth-pusher-secret
OpenDataHub       | opendatahub-thoth-pusher-secret
ODH-Jupyterhub    | odh-jupyterhub-thoth-pusher-secret

It is the responsibility of the Users/Developer to setup a robot or a serviceaccount in the image registry and pass on the kubernetes secret containing `.dockerconfigjson` secret. On the quay repository, the robot can be setup and the kubernetes secret of the robot can be passed to the aicoe-ci instance. This secret would be setup in the instance and would be available for the users to specific as a registry-secret. Steps to setup robot in quay and configure it to the quay repository:

- First, we need to create a robot in the Organization (also possible to setup in individual account).<br>
  Adding a robot account<br>
  Click on Create Robot Account and enter a name for the account. The username will become namespace+accountname where namespace is the name of the user or Organization.<br>
  ![quay-robot](/docs/quay-robots.png)

- Click on the Robot creation, goto kubernetes secret and pass on that information to aicoe-ci instance. Currently you would have to pass it on by contacting us, we are still trying to figure out some alternative

- Once the secret is passed we could get that secret to the aicoe-ci instance, then it would be ready to be used as `registry-secret`.

**NOTE**: Developer has to provide that robot **write** access to the repository, they wish to build and push container image.

#### Configuring Deploy requirements

AICoE-CI enable users to utilize the GitOps power and update manifest files with relevant information from the builds.<br>
User can point the context path and repository of the imagestream manifest, that has to be updated with the newly built available image tag.

```yaml
deploy:
  project-org: thoth-station # Organization on Github contianing the Repository..
  project-name: thoth-application # Repository on Github containing the kustomize manifests.
  overlay-contextpath: example/overlays/test/imagestreamtag.yaml # Imagestream manifest where tag is to be updated.
```

## How to Contribute

- For Overview on AICoE-CI Pipeline, check: [AICoE-CI Development]()
- For Contribution Details and Setup of dev environment: [Setup and Contribution](docs/how-to-contribute.md)
