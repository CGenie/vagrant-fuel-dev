sources-directory:
  file.directory:
    - name: /vagrant/sources
    - makedirs: true
    - require:
      - pkg: packages

fuel-main-source:
  git.latest:
    - name: https://github.com/stackforge/fuel-main
    - target: /vagrant/sources/fuel-main
    - unless: ls /vagrant/sources/fuel-main
    - require:
      - file: sources-directory

fuel-web-source:
  git.latest:
    - name: https://github.com/stackforge/fuel-web
    - target: /vagrant/sources/fuel-web
    - unless: ls /vagrant/sources/fuel-web
    - require:
      - file: sources-directory

fuel-astute-source:
  git.latest:
    - name: https://github.com/stackforge/fuel-astute
    - target: /vagrant/sources/fuel-astute
    - unless: ls /vagrant/sources/fuel-astute
    - require:
      - file: sources-directory

fuel-ostf-source:
  git.latest:
    - name: https://github.com/stackforge/fuel-ostf
    - target: /vagrant/sources/fuel-ostf
    - unless: ls /vagrant/sources/fuel-ostf
    - require:
      - file: sources-directory

fuel-library-source:
  git.latest:
    - name: https://github.com/stackforge/fuel-library
    - target: /vagrant/sources/fuel-library
    - unless: ls /vagrant/sources/fuel-library
    - require:
      - file: sources-directory

fuel-docs-source:
  git.latest:
    - name: https://github.com/stackforge/fuel-docs
    - target: /vagrant/sources/fuel-docs
    - unless: ls /vagrant/sources/fuel-docs
    - require:
      - file: sources-directory

fuel-specs-source:
  git.latest:
    - name: https://github.com/stackforge/fuel-specs
    - target: /vagrant/sources/fuel-specs
    - unless: ls /vagrant/sources/fuel-specs
    - require:
      - file: sources-directory
