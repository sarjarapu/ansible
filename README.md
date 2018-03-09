Role Name
=========

A brief description of the role goes here.

Provision AWS Instances
------------

If you need to provision infrastructure on Amazon Web Services then you could use the playbook `01.create.instances.yml`

`ansible-playbook 01.create.instances.yml`

Implement Production Notes
--------------

Implement system configurations that affect MongoDB, especially when running in production.

`ansible-playbook 02.install.configure.mongod.yml`

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
