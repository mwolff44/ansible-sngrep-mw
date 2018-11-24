# Ansible Role: ansible-sngrep-mw

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
- molecule
- docker
