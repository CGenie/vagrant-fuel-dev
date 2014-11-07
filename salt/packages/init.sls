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
      - firefox
      - make
      - nginx
      - nodejs
      #- npm
      - openjdk-6-jre
      - postgresql
      - postgresql-server-dev-9.1
      - python-dev
      - python-ipaddr
      - python-paramiko
      - python-pip
      - python-nose
      - python-software-properties
      - python-yaml
      - rsync
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
      - x11-utils
      - x11-xserver-utils
      - xinit
      - xserver-xorg-video-dummy
      - xvfb
      - yum
      - yum-utils
    - require:
      - pkgrepo: pkgrepos

py26-fake-interpreter:
  file.symlink:
    - name: /usr/bin/python2.6
    - target: /usr/bin/python2.7

gitconfig:
  file.managed:
    - name: /home/vagrant/.gitconfig
    - source: salt://packages/gitconfig
    - user: vagrant
    - group: vagrant
