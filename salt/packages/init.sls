pkgrepos:
  pkgrepo.managed:
    - ppa: chris-lea/node.js

packages:
  pkg.latest:
    - pkgs:
      - build-essential
      - curl
      - debootstrap
      - extlinux
      - genisoimage
      - git
      - imagemagick
      - isomd5sum
      - kpartx
      - libmysqlclient-dev
      - libvirt-bin
      - make
      - nginx
      - nodejs
      #- npm
      - postgresql
      - postgresql-server-dev-9.1
      - python-dev
      - python-ipaddr
      - python-paramiko
      - python-pip
      - python-nose
      - python-software-properties
      - python-yaml
      - ruby
      - ruby-dev
      - rubygems
      - screen
      - software-properties-common
      - tmux
      - unzip
      - vim
      - vim-nox
      - python-virtualenv
      - virtualenvwrapper
      - yum
      - yum-utils
    - require:
      - pkgrepo: pkgrepos

py26-fake-interpreter:
  file.symlink:
    - name: /usr/bin/python2.6
    - target: /usr/bin/python2.7
