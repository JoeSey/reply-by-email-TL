# Reply by email trust level plugin for Discourse

A simple plugin to make the availability of **reply by email** dependent on the recipient's trust level. This is a plugin for [Discourse](http://discourse.org).

Early development version, beware. Things might break.

## Installation:
- follow [these steps](https://meta.discourse.org/t/install-a-plugin/19157).
- or, ssh into your Docker container. Do a ```cd /var/www/discourse/plugins; git clone https://github.com/JSey/reply-by-email-RL``` and next, ```rake assets:precompile&& sv restart unicorn``` (on a production install. On development, you know the drill...)

## Configuration:

Go to the Plugin settings and enter the TL which is required to use reply by email. Of course, higher TLs are included, i.e.
if you enter TL 1, then TL 2 and up users will be able to use email replies as well.

## ToDo
- test this thing!