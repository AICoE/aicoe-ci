
## Release 1.1.0 (2022-03-02T11:52:37)
* Remove maintainer list from .thoth.yaml (#166)
* :turtle: Enable few of orgs to sign the image with chains
* :panda_face: Fix the image issue in tag-release task
* :turtle: Enable image digest and image info set as result (#163)
* :city_sunrise: Allow arch build with overlays feature (#161)
* Add tag value to job name for summit demo
* use of default_branch instead of master keyword
* Introduce custom tag push with issue release pipeline
* Fix the python interpretor for the script
* Refactored the code with python instead of bash for tag delivery
* Using the python -m build for generating package artifacts
* Use twine image for the build of the python package artifact
* set the default base image as the python 3.8 image
* Add resources for container build steps
* Include a user for learning elyra
* :boom: Patch up the pulp upload template with the latest changes
* Fix the permission issues
* Fix the permission issues
* Propogate requirements info to a specific dir
* Update pre-commit repos to use https
* Update OWNERS
* Some spelling and link fixes
* Update labels on issue templates
* adding the custom rhods pipeline as well to overlay listener
* updating tekton trigger definitions to 14.2
* fix the apiversion for the git-add-releas-artifacts
* fixed the notification of pipelines deployment
* fix: corrected the kustomize file resources
* creating the github-release tekton task
* fix: included the missing manifest details in kustomize file
* Update tasks/init-task.yaml
* check the owners file in the repo as well as github association rules
* creating the github-release tekton task
* :turtle: restrict solvers pull request checks
* :hatching_chick: Fix the template name reference based on upgrade tt v0.12.0
* Add description of the pipeline to aicoe-ci
* Extend gather metrics pipeline for multiple deployments
* :turtle: patch up the ceph configmaps
* patch up the ceph configmpa
* :lock: update ceph and os-climate creds for deployment
* :robot: set tekton-dashboard route with acme
* :boom: Reduce the continuous request of prescription
* reset the debugging for tekton dashbaord
* debugging the tekton dashbaord
* Adjust the aicoe-ci setup for the moc cluster
* Adjust the aicoe-ci setup for the moc cluster
* :fire: patch up the spelling mistake
* :panda_face: github template for requesting help with sesheta invite
* :droplet: comment in the issue of delivery of module based on package
* :panda_face: support re-upload of package via issue template
* Initialize the declared result params
* :four_leaf_clover: patch up the condition for the package upload
* :umbrella: update the secrets for the pulp-pypi index
* :panda_face: fix for the configuration file respect to the paths
* :robot: fix the pre-commit issues
* :cloud: feature to upload packages to pulp-pypi
* :fire: allow all to do retest on prs
* :game_die: set ssh_url for the upstream sync tasks
* Fix upstream-sync task (#116)
* :fire: correct the code to pick right base image for the overlays
* :cloud: update the tekton-dashboard certs
* support aiisv pusher secret with the aicoe-ci
* set stage to support on the testing repo
* set the model pipeline to run on the elyra-aidevsecops repo
* add missing input
* Use new patch realease
* add missing resource for configuration task
* correct-param
* move param discovery to configuration
* Add checkout and correct link to use SHA
* update sha pipeline-helpers
* adjust template
* update setup-instance
* Add tasks and resources
* Add pipeline
* add git model template
* fix up the overlay pipeline creation as it break 64char constraint
* :hourglass: Introduce the model pull-request pipelines
* Fix build-analysis request submission failure with additional conditions
* Reduce the pipelinename size to satisfy the webhook validation
* Remove additional rolebinding which might not be reqiured
* :whale: fix the tekton-pipeline access as well
* :whale: include the tekton-pipeline access as well
* :whale: fix the openshift-pipeline access requirement
* fix: Use rbac api group for bindings to sync nicely in ArgoCD (#109)
* :guardsman: update the secrets
* include bindings type for syncing
* enable psi deployemnt to function with openshift-pipeline v1.2.3
* Switch to trigger.ref from trigger.name based on tekton-trigger v0.12.0 above change
* Maintain trigger template that follows tekton-trigger: v0.8.1 above
* couple the release pipeline with build analysis
* :turtle: serve only opened and reopened issue templates
* update the env var in the issue build task
* dont skip the git cherry pick
* include z-stream update for rhods to the pipeliens
* support rhods sync up with odh upstream
* updated the pull request title based on users request
* :turtle: include env var THAMOS_RUNTIME_ENVIRONMENT for the image build
* included the custom url inplace of cluster url
* updated the gitignore with scripts
* :fireworks: change the arch with bg image
* :robot: enable z-stream release for operate-first
* :guardsman: enable user gage to use the tool
* :turtle: use cel interceptor to restrict the issue pipelines
* :fire: Reduce the cpu usage for the tasks
* handle moc tekton custom route via aicoe-ci deployment
* disable tekton dashboard custom url setup via aicoe-ci
* introduce a custom name for the moc zero tekton dashboard
* update the dashboard url for the tekton tasks
* deprecate tox testing via aicoe-ci
* serve the pull request on few aspects
* allow the cluster to setup the route host directly
* :maple_leaf: serve only specific issues
* :whale: request higher memory for larger image builds
* segregate github events before triggering a pipeline
* Request memory for image push as image can be large
* deploy clean up task for stage instance
* Timeout extend for the tag release pipeline
* Work based on the configuration stated
* configure the ssh key to used from absolute path
* configure the ssh key to used from absolute path
* :hourglass: cleanup pipelineruns from the cluster via a cronjob
* :maple_leaf: filter pipelines to serve only gitops issue comments via cel
* :whale: setup route for moc deployment
* set higher timeout for tag release pipelines
* rewritten check in python
* Update missing resource for issue-release pipelines
* update the init task indentation
* Fix the colon in the python script
* Fix the extra quotes in the tasks
* migrate from bash script to python scripts
* support build and deliver overlay pattern projects (#93)
* :four_leaf_clover: fix variable declaration in the issue deploy task
* :four_leaf_clover: fix variable in the issue deploy task
* :four_leaf_clover: Allow issue pipelinerun to update kustomize files
* accomodate the tekton triggers v0.8.1 and v0.6.1 changes
* Temporary removal of the notification job for deployment
* Fix the path of the deployment notification env
* encrypt the secret with moc sops
* fix the path of the manifest secrets generator
* :dragon_face: restructured the manifest for kustomize support with deployment
* :guardsman: include the operate-first quay support for images
* :christmas_tree: updated the bot cred for pypi
* use different image source for tox check
* :rainbow: include the env var git repo name in s2i script based method
* :anchor: enable GIT_REPO_NAME to be added to the s2i image builds (#84)
* :honeybee: Deliver missing package module to pypi
* :arrow_down_small: stick to html cloning for now
* updated README and base image for pytest38 checks
* :arrow_up: updated source image for pytest and pre-commit
* :arrow_up: updated source image for thoth-ubi, pytest and pre-commit
* sync pipeline added which creates tag for sibling projects
* enable pull-request deploy task to use proper tag
* :books: updated info on setup of bot account for quay
* :rocket: update triggerbinding to be compatible with tekton triggers v0.6.1
* use quay based image to stay in  rate limits
* :sparkles: add ADR
* :star: allow users to define context path in the tag builds
* :game_die: use the default branch from the payload
* attach github secret with aicoe-ci serviceaccount
* Add Rebase Task (#73)
* pr prefix would be added to the pull request builds
* :arrow_up: bump up container build resources request
* :arrow_up: bump up pull request build resources
* :rabbit2: use default project name if not set in configuration (#71)
* :mouse2: allow users to push the tag image to another custom tag (#70)
* :rocket: update new dashboard link for the status
* :rocket: patch up ultrahook setup for production
* :scroll: fix links in the how-to-contribute document
* :scroll: update how-to-contribute documentation
* :books: contribution document updates
* :wrench: closely pack checking conditions in the pipeline
* :snail: patch update the pull-request-pipeline result var configuration
* :turtle: allow users to define dockerfilepath in the config file
* :books: Updated AICoE-CI README.md
* :snail: allow condition to execute on non config repos
* :arrow_up: include python3.8 based pre-commit and pytest
* :rocket: support python3.8 based pre-commit and pytest check (#65)
* :panda_face: increase resource requirement for pre-commit to fix exitcode 137
* :panda_face: increase resource requirement for build and pytest tasks
* :arrow_up: bump version in kustomize for the application

## Release 1.0.0 (2020-09-10T07:26:23)
### Features
* :package: enable kebechet to update changelogs
* :turtle: handle aicoe-ci serviceaccount with manifest files
* :panda_face: assign pullrequest pipeline corresponding name
* :on: update thoth-ci to aicoe-ci in all components
* :sparkles: changed ultrahook destination
* Revert "tag created by pipeline has a pr- prefix (#56)"
* Revert "removed th pr- prefix form some container image names used during build"
* Revert "fixed admission webhook "webhook.pipeline.tekton.dev" denied the request: mutation failed: cannot decode incoming new object: json: unknown field "ßescription""
* :books: Updated AICoE-CI README.md
* tag created by pipeline has a pr- prefix (#56)
* :inbox_tray: Included more verbose output response from issue-release-pipeline
* :turtle: update issue-pipelien to comply with configuration schema
* :panda_face: pullrequest build pipeline to comply with custom configurations (#51)
* :lock: allow aicoe-ci pipeline to serve odh with builds
* :snowman: allow user to disable different checks through config file
* :snowman: allow user to disable pytest for there application
* :neckbeard: send out commit message with emojis
* :anchor: allow users to use multiple pytest env var
* :herb: Allow users to instate env vars for pytest
* :beetle: Default value not need for build stratergy
* :arrow_up: upgrade task tag-build
* :lock: update ci pipeline secrets
* :rotating_light: Allow user to utilize s2i script-url feature
* :arrow_up: updated as s2i-thoth is at 0.14.2 version
* :arrow_up: update due to https://github.com/thoth-station/s2i-thoth/blob/master/RELEASES.rst\#v0141
* pr handling pipeline to support configuration file
* set the default value for overlay param
* updated kustomization with new tasks
* passing pipeline name from pipelinerun to pipeline
* tag-release pipeline support configurationfile and custom pipeline
* include git_ref description
* enable tag pipeline to use configuration
* custom pipeline task and configuration task
* custom pipeline and pypi release conditions
* :sparkles: introduces s2i-thoth-py3{6|8} PipelineResources which point to their corresponding tags on quay.io
* Explore with direct api request to set pr status
* Experiment with tekton pr status update
* Enable build check to observe the build instead of output image
* :sparkles: added a kube-like OWNERS file
* :sparkles: no more verbose about unknown commands
* :sparkles: no pipeline will no longer merge any PR
* Testing: remove approve for repos
* Secret required for pushing image to quay repository
* Fixes for the issue based delivery
* Update resource.yaml
* Use s2i-thoth-ubi8-py36:v0.12.7
* Use the correct pipeline to traverse from PR
* publish python module to pypi through aicoe-ci
* Approve check uses CODEOWNER file
* deploy should independent of retest
* updated pipelinerun to set github pr status.state to 'pending'
* :arrow_up: using new s2i-thoth version
* Update issue related stuff in kustomize
* Feature: use a template issue for build and deliver
* show coala checks in PR comments
* details of tekton installation on
* pipelinerun sets github pr status.state to 'pending'
* added webhook-tag-binding, it was missing somehow
* :sparkles: ultrahook is deploy alongside
* :sparkles: using v0.12.5 of S2I builder image
* Filter out the patches warning
* Include precommit task for deployment
* pre-commit check are included into pipeline
* point to precommit image
* :sparkles: no longer using 'argocd' namespace to run the chat notification jobs
* add pre-commit task based on coala task
* Turn off Thamos advise at build time
* Feature: On /deploy convey the image tag to thoth-application
* :sparkles: now we also support a Containerfile, which is equivalent to a Dockerfile (content-wise)
* Updated the secret for secrets functions
* Webhook for sefhwt-abwy to talk with
* Display the pipelinerun associated with tasks
* approve condition check change
* Fix condition of approval
* Include the task pr-merge
* Pipeline should be removed when pr is closed
* updated kustomization with new tasks
* deploy feature to make a commit to argo
* Build based on the Dockerfile present
* additional files required for approve feature
* approve feature to merge the pr
* updated to s2i-thoth to current release
* keep the repo full name in pipeline
* Remove unused variables
* Let Argo also maintain condition deployment
* Utilize ubi images where necessary
* Utilize ubi image in the condition
* Enable condition for tag release
* Build check doesn't require image in cluster
* re-encrypted
* added AICoE ArgoCD GPG key
* Fix deletion of pipeline on merge
* Fixes the build check failure
* Enable test to only run which required
* Revert back to repo-tag name as buildah image
* Maintain uniqueness in pipelinerun name
* Allow any tag value for image release
* redundant attribute
* hotfix :)
* added bot label to templates
* added new triggers/bindings introduced with d48852def9d8d7b478b38693fc4ebb931e53744e
* Release image to quay on tag creation
* move all the role/SA/binding to kustomize
* added the missing files from tasks/
* added set-running-state step
* added pre-commit config file, and a little bit of reformatting
* added pending state reporting to checks
* let's try to run the notification in argocd namespace
* On /deploy release the PR image to quay
* Fix of the mountvolume path
* Move trigger related work to triggers dirs
* Condition checks for task to validate on
* Build image as a check
* Single initiate tasks for small checks
* Allocate memory usage to checks
* added a threadKey to the message
* added the tektoncd catalog as a git submodule and a few of its tasks to kustomization
* workaround kustomize not being able to handle generateName, see https://www.gitmemory.com/issue/argoproj/argo-cd/1639/494999921
* just format changes
* set TLSVERIFY to false
* all the github standard templates
* Push images to quay
* Include the s2i thoth env var to build
* updated pipelinerun to be compatible with v1beta1
* updated pipeline to be compatible with v1beta1
* add note on excluding kinds
* updated tasks to be compatible with v1beta1
* updated tasks to be compatible with v1beta1
* updated role with new apiversion changes
* Include thoth env vars in the builds
* Updated apiversion for triggers
* reformatted
* added secret 'github-secret' which contains the webhook secret of the github application
* gcp config to be ignored
* ignore secrets, they need to be encrypted using sops
* ...
* migrated setup.sh to kustomize
* :pencil: status is not needed to be updated at opening
* :scroll: update README
* :paper: Added sample task, pr-build, other pr related tasks
* :star: Bind additional role for the trigger sa
* :package: pipeline upgrade with additional params
* Build image on each PR
* Assign edit role for thoth-ci to process
* :scroll: update README
* :books: taking notes on findings
* labelled the tasks component with app
* labelled the pipeline component with app
* labelled the component with app
* Updated required fields in triggers
* secret template for thoth-ci secrets
### Bug Fixes
* :bug: fixed typo in pr-config task
* Revert ":bug: fixed a faulty name"
* fixed admission webhook "webhook.pipeline.tekton.dev" denied the request: mutation failed: cannot decode incoming new object: json: unknown field "ßescription"
* :bug: fixed a faulty name
* :arrow_up: The UBI8 based images have been updated to the latest tags to include fixes for https://access.redhat.com/errata/RHBA-2020:3156
* :open_mouth: fix check condition in configuration setup
* fix the condition exit_code usage
* include storage-driver overlay for uid,group fix
* fix the image required for pypi upload
* Formatting fix of the comment for fail test
* fix the approve conditions
* :sparkles: ultrahook is communicating directly with eventlistener service (as we are in the same namespace), not via the route
* :bug: fixed the Containerfile support :/
* :bug: fixed the Containerfile support :/
* The PR build s2i environment are set as ENV vars instead of ARG vars
* The s2i environment are set as ENV vars instead of ARG vars
* :bug: fixed the version tag :/
* moved  after the exit_code evaluation
* clear pipelinerun once the pr is merged
* fixing environment variable of s2i thoth
* fixed `oc apply imagestream` to be `oc create imagestream`
### Improvements
* :hatching_chick: pull request config to be set correspondingly
* removed th pr- prefix form some container image names used during build
* deploy imagestream to the common imagestream.yaml
* updated tekton pipeline setup instructions
* :pencil: just a structure for some onboarding document
* instruction on setup up bots and ci services
* :sparkles: no more welcome message for each PR ;)
* :arrow_up: updated to the latest and greatest s2i-thoth
* :sparkles: removed all coala related things, as we use pre-commit now
* project names are no longer included in pipelinename
* include tox test checks
* Fix the format of the comment
* use label to separate the pipelines
* updates to use v0.12.6
* use github api task for updating status
* :sparkles: updated the notification, run notification in infra namespace
* :arrow_up: updated the tektoncd catalog to the latest version of v1beta1 branch
* :bug: do we really need this case-sensitive?!
* :sparkles: using updated builder image
* :sparkels: updated to the latest and greatest thoth-s2i
* removed the GKS thing
* updated the fixtures
* Include ubi and ubi-minimal images for use
* shuffeled a few files around
* Multi binding for PR and Issue events
* updated tekton dashboard
* updated s2i thoth image version
* added secrets for ultrahook and the access token
* removed redundant resource declaration
* :nut_and_bolt: just example payloads and results for help
* setup and takedown scripts updated
* structurize the task, pipeline and roles
* scripts to setup and takedown pipeline
* tekton pipeline and trigger scripts
### Non-functional
* :radio: process pull request based on its configuration
* Utilize api request instead of tekton pull request resources
* Dont use pull request resource for output
### Other
* remove unwanted files
