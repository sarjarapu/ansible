Create Self Signed OpenSSL
=========

The following procedure creates a set of certificates / private keys matching the above diagram

- Create self-signed root certificate. It is used for signing all of the other certificates

- Generate the private root key file. This file should be kept secure.

  ```openssl genrsa -out rootCA.key 2048```

- Generate the public root certificate. It is our CAFile that has to be distributed among the servers and clients so they could validate each other’s certificates

  ```openssl req -x509 -new -nodes -key rootCA.key -days 365 -out rootCA.crt```

Requirements 
=========
On host that executes module, make sure these requirements are pre-installed
- python-pyOpenSSL >= 0.15 (if using selfsigned or assertonly provider)
- acme-tiny (if using the acme provider)

Issues with RHEL
=========

RHEL 7+ comes with default installation of pyOpenSSL via rpm package. However it's version of 0.13.1. Although you install latest version via pip, ansible module for the open_certificate etc. will use the pyOpenSSL from the rpm. So first you need to uninstall it and then install the latest via pip

```
rpm -qa | grep pyOpenSSL
pyOpenSSL-0.13.1-3.el7.x86_64

pip freeze | grep OpenSSL
```

After many attempts .. below code is stripped out and falling back on the shell commands as the preview module is still failing 

```
  - name: add epel yum repository
    become: true
    yum:
      name: https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
      state: present

  - name: install pip via yum
    become: true
    yum:
      name: python-pip
      state: latest

  - name: uninstall existing pyopenssl dependency, if any 0.13.1
    become: true
    yum:
      name: pyOpenSSL
      state: absent

  - name: install pyopenssl dependency for openssl
    become: true
    pip:
      name: "pyOpenSSL"
      state: present
      version: 17.5.0
      extra_args: --ignore-installed --no-cache-dir
    
  - name: create crt, private and csr folders at /etc/ssl
    become: true
    file:
      state: directory
      path: "/etc/ssl/{{ item }}"
      mode: 0755
    with_items:
      - crt
      - csr
      - private

  - name: generate a self signed openssl certificate for rootCA
    become: true
    openssl_certificate:
      path: "/etc/ssl/crt/rootCA.crt"
      privatekey_path: "/etc/ssl/private/rootCA.pem"
      provider: selfsigned
```