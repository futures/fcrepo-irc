fcrepo-irc
======================================

A simple Sinatra app that receives Fedora webhooks and relays messages to an IRC channel.

## Running the app

```bash
$ bundle install
$ channel="#name_of_an_irc_channel" rackup
```

The default `nick` is "fcrepo-bot" and the default `irc_server` is "irc.freenode.org".

## Registering fcrepo-irc with Fedora

```bash
# Assuming
#   1) your Fedora instance is deployed at http://fcrepo.example.com/rest/
#   2) fcrepo-irc is running at http://fcrepo-irc.example.com
#   3) 1 is an unused webhooks id (pick any identifier you like)

$ curl -X POST http://example.com/rest/fcr:webhooks/1 --data-urlencode "callbackUrl=http://fcrepo-irc.example.com"

```

## Heroku deployment

fcrepo-irc is also readily deployable to Heroku. You need only set the channel environment variable, e.g.:
```bash
$ heroku config:set channel="#name_of_an_irc_channel"
```
