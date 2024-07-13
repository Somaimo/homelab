PowerDNS
=========

Role to install and configure PowerDNS DNS Server for a authoritative DNS Server for a internal dns.

Requirements
------------

The assumption is, that you have setup a host where the service will be instatiated and you want to create an authoritative dns server for a domain. If you don't want to create an authoritative dns server, use a different role.

**This only works on Debian / Ubuntu at the moment**

Role Variables
--------------

The following variables are required for the role to function properly.

- powerdns.domain - domain for which PowerDNS is authoritative
- powerdns.dyndns.enabled - Set it to true, if you want to enable dynamic dns updates (from dhcp servers for exampl)
- powerdns.dyndns.tsig_key - set TSIG encryption key. You can create one with pdnsutil generate-tsig-key [name] hmac-sha512
- powerdns.dyndns.tsig_schema - set TSIG schema (normally hmac-sha512) corresponding to the above tsig_key
- powerdns.dyndns.allow_update_from - (space seperated) list of ip addresses (in CIDR Format) that can send updates. Example: single host -> 8.8.8.8/32, whole subdomain -> 192.168.20.0/23 
- powerdns.dyndns.domain - domain for which you want to allow updates
- powerdns.webfrontend.enabled - Set it to true if you want to enable the webinterface (PDNS Admin - https://github.com/PowerDNS-Admin/PowerDNS-Admin)
- powerdns.webfrontend.hostname - (fqdn) hostname where the webfrontend is hosted

Dependencies
------------

No dependencies.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: madq.powerdns, powerdns.domain: abc.com, powerdns.version: 12.4, powerdns.dyndns.enabled: false, powerdns.webfrontend.enabled: false }

License
-------

BSD

