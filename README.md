vagrant-fuel-dev
================

Vagrant SaltStack-based configuration for a development environment of Mirantis Fuel platform.

## Usage

Clone this repo, `cd` into `sources` directory and run

```bash
git clone https://github.com/stackforge/fuel-main
git clone https://github.com/stackforge/fuel-web
git clone https://github.com/stackforge/fuel-astute
git clone https://github.com/stackforge/fuel-ostf
git clone https://github.com/stackforge/fuel-library
git clone https://github.com/stackforge/fuel-docs
```

Then just run

```
vagrant up
```

to set up the virtualenv.

Then run

``
vagrant ssh
workon fuel
```

to SSH into the virtual machine and set up the Python virtualenv. To start the server type

```
/sources/fuel-web/nailgun/manage.py run --fake-tasks
```

and point your browser to (http://localhost:8200)[http://localhost:8200] (username/password for the test env is `admin`/`admin`).

Sometimes it might be necessary to repopulate the DB with fixtures, to do this just type

```
./manage.py syncdb
./manage.py loaddefault # It loads all basic fixtures listed in settings.yaml
./manage.py loaddata nailgun/fixtures/sample_environment.json  # Loads fake nodes
```

To run tests (webui):
```
cd /sources/fuel-web
./run_tests.sh -w -l
```

The `sources` directory is mounted under `/sources` on the Vagrant machine using Rsync for better performance.

For more information see (http://docs.mirantis.com/fuel-dev/develop/nailgun/development/env.html)[http://docs.mirantis.com/fuel-dev/develop/nailgun/development/env.html] and (http://docs.mirantis.com/fuel-dev/develop/env.html)[http://docs.mirantis.com/fuel-dev/develop/env.html]
