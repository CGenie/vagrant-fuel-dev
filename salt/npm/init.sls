grunt-cli:
  cmd.run:
    - name: npm install -g grunt-cli

phantomjs:
  cmd.run:
    - name: npm install -g phantomjs

fuel-web-npm-install:
  cmd.run:
    - name: npm install
    - cwd: /sources/fuel-web/nailgun
    - require:
      - git: fuel-web-source
      - cmd: grunt-cli

fuel-web-grunt-bower:
  cmd.run:
    - name: grunt bower
    - cwd: /sources/fuel-web/nailgun
    - require:
      - cmd: fuel-web-npm-install
