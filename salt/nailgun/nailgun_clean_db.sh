#!/bin/bash

. /etc/bash_completion.d/virtualenvwrapper

workon fuel

cd /sources/fuel-web/nailgun

./manage.py syncdb
./manage.py loaddefault # It loads all basic fixtures listed in settings.yaml
./manage.py loaddata nailgun/fixtures/sample_environment.json  # Loads fake nodes
