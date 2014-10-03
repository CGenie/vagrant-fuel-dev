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
