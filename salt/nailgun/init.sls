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

rvm-keys:
  cmd.run:
    - name: gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    - user: vagrant
    - group: vagrant

get-rvm-io:
  cmd.run:
    - name: bash salt://nailgun/get-rvm-io.sh stable
    - unless: ls /usr/local/rvm
    - require:
      - cmd: rvm-keys

packages-ruby-2.1:
  cmd.run:
    - name: source /etc/profile.d/rvm.sh && rvm install 2.1
    - unless: ls /usr/local/rvm/rubies/ruby-2.1.5/bin/ruby
    - require:
      - cmd: get-rvm-io

raemon-gem:
  cmd.run:
    - name: source /etc/profile.d/rvm.sh && rvm user gemsets && rvm gemset create astute && rvm use 2.1@astute && gem build raemon.gemspec && gem install raemon-0.3.0.gem && gem install bundler
    - user: vagrant
    - group: vagrant
    - cwd: /home/vagrant/raemon
    - unless: /home/vagrant/raemon/raemon-0.3.0.gem
    - require:
      - cmd: packages-ruby-2.1
      - git: raemon-source
