# FUGUE-STATE-IO
==============

dot-files sets up running context for all local scripts and installs some dependencies for developing fugue-state-io services

## Manual steps
Install Homebrew for linux/osx compatibility

## Automated steps
Intended to be run in a Docker outside of Docker dev container

### workspace_setup.sh
This will install brew, set up auth for git, doctl. It will then clone other repos adjacent to your local repo. 

### idempotent_profile_setup.sh
This will append a `###FUGUE_STATE_CONFIG###` section to your .rc file.
```./bootstrap_workspace.sh```
This installs dependencies and sets up the local development environment.
