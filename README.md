A heroku plugin to talk to your redis instances on heroku.

Installation
------------

Requirements:

* The heroku gem — `gem install heroku`

* A local installation of redis (or at least the redis-cli utility) — `apt-get install redis-server`

To install:

* `heroku plugins:install https://github.com/rapportive-oss/heroku-redis-cli.git`

Usage
-----

* `heroku redis:info` — get run-time statistics from your redis.

* `heroku redis:monitor` — monitor commands being sent to your redis in real time.

* `heroku redis:cli` — execute custom commands against redis.

Arguments
---------

Each command can take the heroku `--app APPNAME` parameter, and a `--db REDIS_URL` parameter (which defaults to `REDISTOGO_URL`) for selecting which redis to connect to.

For `heroku redis:cli`, you can run it in interactive mode:

    heroku redis:cli

or specify a single command to run on the argument list:

    heroku redis:cli get 10

or pipe a file of redis commands.

    heroku redis:cli < script.redis

For any command can also specify any arguments that `redis-cli` expects. Where these conflict with information from the environment variable, the explicit options take precedence:

* `-h X` — connect to redis on host named X.
* `-p X` — connect to redis on port named X.
* `-a X` — execute AUTH X after connecting.
* `-n X` — execute SELECT X after connecting.
* `-r X cmd *args` — repeat the following command X times.
* `-v` — print out the version of redis-cli.

Meta-fu
-------

This is licensed under the MIT license, contributions welcome.
