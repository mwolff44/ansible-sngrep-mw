# Ansible Role: ansible-sngrep-mw

* Development branch: [![Build Status](https://travis-ci.org/mwolff44/ansible-sngrep-mw.svg?branch=development)](https://travis-ci.org/mwolff44/ansible-sngrep-mw)
* Master branch: [![Build Status](https://travis-ci.org/mwolff44/ansible-sngrep-mw.svg?branch=master)](https://travis-ci.org/mwolff44/ansible-sngrep-mw)

Ansible role for sngrep, the great SIP tool

## Using the role
### Installation
```
ansible-galaxy install ansible-sngrep-mw
```

### Example Playbook
```
  - hosts: all
    roles:
      - ansible-sngrep-mw
```

### Variables

See [`defaults/main.yml`](defaults/main.yml).

## Testing the role

### Dependencies
- Bundler 1.13.0+
- Ruby 2.3.0+
- Docker 1.12.0+
- See [`Gemfile`](Gemfile)
- See [`requirements.txt`](requirements.txt)

### Setup
1. Install the necessary tools: [`test/scripts/before-install.sh`](test/scripts/before-install.sh)
1. Install required gems from inside the root of the project: [`test/scripts/install.sh`](test/scripts/install.sh)
1. Run lint checks and tests: [`test/scripts/test-role.sh`](test/scripts/test-role.sh)

Note that after installing the required gems you can run other Test-kitchen commands besides the ones listed in [`test/scripts/test-role.sh`](test/scripts/test-role.sh).

### Parallel test execution

There are two ways to run builds in parallel:

1. Use the [Travis-CI Build Matrix feature](https://docs.travis-ci.com/user/customizing-the-build#Build-Matrix): uncomment the relevant environment variable in [`test/scripts/test-role.sh`](test/scripts/test-role.sh) and whenever you add a new suite or platform, add all the relevant test instances to [`.travis.yml`](ansible-sngrep-mw/.travis.yml), in the `env` section. This has the advantage that for each instance you will have a separate build job, all part of the same build. Disadvantages are that you have to keep the `env` section updated every time you add a suite or a platform and that this solution is a Travis-CI-only feature. If you use another CI system in the future, you have to figure out how to configure that system to have parallel builds.
1. Use the Test-Kitchen parallel build feature: builds are parallelized directly by Test-Kitchen: uncomment the relevant command switch in [`test/scripts/test-role.sh`](test/scripts/test-role.sh). You don't have to manage the `env` section in `.travis.yml` like the solution above but the `stdout` and `stderr` of each build will come unordered in the Travis-CI build output view, so it may be more difficult to check what went wrong. Also this solution is more portable compared to the previous one because it does not depend on the CI system, but only on Test-Kitchen.

Note that parallelization is disabled by default.
