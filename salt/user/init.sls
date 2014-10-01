vagrant-virtualenv-bash-source:
  file.append:
    - name: /home/vagrant/.bashrc
    - text: source /usr/local/bin/virtualenvwrapper.sh
    - require:
      - pkg: packages
