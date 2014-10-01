fuel-main-source:
  git.latest:
    - name: https://github.com/stackforge/fuel-main
    - target: /sources/fuel-main
    - require:
      - pkg: packages

fuel-web-source:
  git.latest:
    - name: https://github.com/stackforge/fuel-web
    - target: /sources/fuel-web
    - require:
      - pkg: packages

fuel-astute-source:
  git.latest:
    - name: https://github.com/stackforge/fuel-astute
    - target: /sources/fuel-astute
    - require:
      - pkg: packages

fuel-ostf-source:
  git.latest:
    - name: https://github.com/stackforge/fuel-ostf
    - target: /sources/fuel-ostf
    - require:
      - pkg: packages

fuel-library-source:
  git.latest:
    - name: https://github.com/stackforge/fuel-library
    - target: /sources/fuel-library
    - require:
      - pkg: packages

fuel-docs-source:
  git.latest:
    - name: https://github.com/stackforge/fuel-docs
    - target: /sources/fuel-docs
    - require:
      - pkg: packages
