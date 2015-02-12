nailgun-user:
  postgres_user.present:
    - name: nailgun
    - createdb: True
    - createroles: True
    - superuser: True
    - password: nailgun
    - require:
      - pkg: packages

nailgun-db:
  postgres_database.present:
    - name: nailgun
    - db_user: nailgun
    - db_password: nailgun
    - require:
      - pkg: packages
      - postgres_user: nailgun-user

/usr/bin/nailgun_clean_db.sh:
  file.managed:
    - source: salt://nailgun/nailgun_clean_db.sh
    - mode: 0777

raemon-source:
  git.latest:
    - name: https://github.com/nulayer/raemon.git
    - rev: b78eaae57c8e836b8018386dd96527b8d9971acc
    - target: /home/vagrant/raemon
    - user: vagrant
    - group: vagrant
    - unless: ls /home/vagrant/raemon

raemon-gem:
  cmd.run:
    - name: gem build raemon.gemspec && gem install raemon-0.3.0.gem
    - cwd: /home/vagrant/raemon
    - user: vagrant
    - group: vagrant
    - unless: /home/vagrant/raemon/raemon-0.3.0.gem
    - require:
      - git: raemon-source
