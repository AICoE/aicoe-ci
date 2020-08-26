# Instructions to setup Bots and Ci services

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
