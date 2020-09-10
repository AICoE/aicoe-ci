
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
