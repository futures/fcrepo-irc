fcrepo-irc
======================================

A simple Sinatra app that receives Fedora webhooks and relays messages to an IRC channel.

## Running the app

```bash
$ bundle install
$ channel="#name_of_an_irc_channel" rackup
```

The default `nick` is "fcrepo-bot" and the default `irc_server` is "irc.freenode.org".
