fuel-virtualenv-dir:
  file.directory:
    - name: /home/vagrant/.virtualenvs
    - user: vagrant
    - group: vagrant
    - makedirs: True

#fuel-virtualenv:
  #virtualenv.managed:
    #- name: /home/vagrant/.virtualenvs/fuel
    #- require:
      #- file: fuel-virtualenv-dir
