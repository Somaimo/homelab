Cloudstack Management
=========

Configures the cloudstack management server with all the necessary components. This is highly opinionated for my own homelab.

Requirements
------------

This role has no explicit requirements, when it comes to additional modules.

Role Variables
--------------

There are a couple of variables that will be read by defaults/main.yml and are presumed to be set through group_ or host_vars.
- cloudstack_management.hostname - fqdn of the hostname where the cloudstack management services (for example the web interface) will be reachable
- cloudstack_management.tls (true/false) - set to true if the frontend proxy should be configured to request a tls cert.
- cloudstack_management.

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
