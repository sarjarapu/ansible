# Anisble Playbooks for AWS

A brief description of the role goes here.

## Setup your environment

Setup a Python's virtual environment to help keep the ansible dependecies not clash with global / user level libraries.

```bash
python3 -m pip install --user virtualenv
python3 -m virtualenv env
source env/bin/activate
pip install -r requirements.txt
```

## Provision AWS Instances

If you need to provision infrastructure on Amazon Web Services then you could use the playbook `01.create.instances.yml`

`ansible-playbook 01.create.instances.yml`

## Implement Production Notes

Implement system configurations that affect MongoDB, especially when running in production.

`ansible-playbook 02.install.configure.mongod.yml`

## Dependencies

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

## Example Playbook

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }