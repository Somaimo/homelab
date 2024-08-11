step_ca
=========

Role to install and configure a smallstep based and yubikey supported internal certificate authority.

**It is very important, that the steps under Requirements are met.**

Additionally, this role also configures step ca to generate revocation list and setup a ACME and SSH provisioner. This role also sets some very strict defaults, that can be viewed in ./templates/ca.json.j2.

You can define custom policies for your CA in the same file above.

Requirements
------------

The assumption is, that you have a Yubikey (with PIV support) setup with a custom PIN, Management Key and PUK set.
This only works if your Management Key **is not protected** by the PIN and is 3DES encrypted. This is a limitation of pcscd and step-kms-plugin.

**This only works on Debian / Ubuntu at the moment**

Role Variables
--------------

The following variables are required for the role to function properly.

- tinyca.name - Name of the CA. Must be supplied.
- tinyca.ca_password - Initial Password for the ca. Must be supplied.
- tinyca.yubi_piv_pin - PIN for the yubikey
- tinyca.yubi_piv_mgmt_key - Management Key of the Yubikey
- tinyca.key_type - Define the Key type EC, RSA or OKP. Defaults to EC
- tinyca.key_curve - Define the Curve P256, P384, P521 or Ed25519 (for elliptic curve key types). Defaults to P256
- tinyca.key_size - Define the kye size, if the key type is RSA. Defaults to 4096. 
- tinyca.key_hash - Define the key hashing algorithm for RSAPKCS #1 and RSA-PSS. Options ares SHA256, SHA384 and SHA512. Defaults to SHA256.
- tinyca.dns_domain - Define a list of hostnames / ip addresses that the certificate authority recognises as its own.
- tinyca.address - Set on what ip address and port the certificate authority web server listens. Defaults to *:443
- tinyca.deployment_type - Define the deployment type of the certificate authority, based on https://smallstep.com/docs/step-ca/configuration/. Defaults to "standalone"

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

