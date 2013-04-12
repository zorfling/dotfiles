.. -*- mode: rst -*-

=================
mercurial_keyring
=================

``mercurial_keyring`` is a Mercurial_ extension used to securely save
HTTP and SMTP authentication passwords in password databases (Gnome
Keyring, KDE KWallet, OSXKeyChain, specific solutions for Win32 and
command line). This extension uses and wraps services of the keyring_
library.

.. _keyring: http://pypi.python.org/pypi/keyring
.. _Mercurial: http://mercurial.selenic.com

How does it work
================

The extension prompts for the password on the first pull/push (in case
of HTTP) or first email (in case of SMTP), just like it is done by
default, but saves the password. On successive runs it checks for the
username in ``.hg/hgrc``, then for suitable password in the password
database, and uses those credentials (if found).

In case password turns out to be incorrect (either because it was
invalid, or because it was changed on the server) or missing it just
prompts the user again.

Passwords are identified by the combination of username and remote
address, so they can be reused between repositories if they access the
same remote repository (or the same SMTP server).

Installation
============

Prerequisites
-------------

Install the keyring_ library:

::

    easy_install keyring

(or ``pip keyring``). On Debian "Sid" the library can be also
installed from the official archive (packages ``python-keyring``
and either ``python-keyring-gnome`` or ``python-keyring-kwallet``).

Note: keyring >= 0.3 is strongly recommended, especially in case text
backend is to be used.

.. _this keyring fork: https://bitbucket.org/sborho/python-keyring-lib

Extension installation
----------------------

There are two possible ways of installing the extension: using PyPi package,
or using individual file.

To install as a package use ``easy_install``:

::

    easy_install mercurial_keyring

and then enable it in ``~/.hgrc`` (or ``/etc/mercurial/hgrc``) using:

::

    [extensions]
    mercurial_keyring = 

To install using individual file, download the
`mercurial_keyring.py`_ file, save it anywhere you like, and
put the following in ``~/.hgrc`` (or ``/etc/mercurial/hgrc``):

::

    [extensions]
    hgext.mercurial_keyring = /path/to/mercurial_keyring.py

.. _the code: 
.. _mercurial_keyring.py: http://bitbucket.org/Mekk/mercurial_keyring/src/tip/mercurial_keyring.py

Password backend configuration
==============================

The library should usually pick the most appropriate password backend
without configuration. Still, if necessary, it can be configured using
``~/keyringrc.cfg`` file (``keyringrc.cfg`` in the home directory of
the current user). Refer to keyring_ docs for more details.

*I considered handling similar options in hgrc, but decided that
single user may use more than one keyring-based script. Still, I am
open to suggestions.*

Repository configuration (HTTP)
===============================

Edit repository-local ``.hg/hgrc`` and save there the remote
repository path and the username, but do not save the password. For
example:

::

    [paths]
    myremote = https://my.server.com/hgrepo/someproject

    [auth]
    myremote.schemes = http https
    myremote.prefix = my.server.com/hgrepo
    myremote.username = mekk

Simpler form with url-embedded name can also be used:

::

    [paths]
    bitbucket = https://User@bitbucket.org/User/project_name/

If prefix is specified, it is used to identify the password (so all
repositories with the same prefix and the same username will share the
same password).  Otherwise full repository URL is used for this
purpose.

Note: if both username and password are given in ``.hg/hgrc``,
extension will use them without using the password database. If
username is not given, extension will prompt for credentials every
time, also without saving the password.

Finally, if you are consistent about remote repository nicknames,
you can configure the username in your `~/.hgrc` (`.hgrc` in your
home directory). For example, write there::

    [auth]
    acme.prefix = hg.acme.com/repositories
    acme.username = johnny
    acme.schemes = http https

and as long as you will be using alias `acme` for repositories like
`https://hg.acme.com/repositories/my_beautiful_app`, username
`johnnny` will be used, and the same password reused.

The advantage of this method is that it works also for `clone`.

Repository configuration (SMTP)
===============================

Edit either repository-local ``.hg/hgrc``, or ``~/.hgrc`` and set
there all standard email and smtp properties, including SMTP
username, but without SMTP password. For example:

::

    [email]
    method = smtp
    from = Joe Doe <Joe.Doe@remote.com>

    [smtp]
    host = smtp.gmail.com
    port = 587
    username = JoeDoe@gmail.com
    tls = true

Just as in case of HTTP, you *must* set username, but *must not* set
password here to use the extension, in other cases it will revert to
the default behavior.

Usage
=====

Configure the repository as above, then just ``hg pull``, ``hg push``,
etc.  You should be asked for the password only once (per every
username and remote repository prefix or url combination).


Similarly, for email, configure as above and just ``hg email``.
Again, you will be asked for the password once (per every username and
email server address combination).

Implementation details
======================

The extension is monkey-patching the mercurial ``passwordmgr`` class
to replace the find_user_password method. Detailed order of operations
is described in the comments inside `the code`_.

Development
===========

Development is tracked on BitBucket, see 
http://bitbucket.org/Mekk/mercurial_keyring/


Additional notes
================

Information about this extension is also available
on Mercurial Wiki: http://mercurial.selenic.com/wiki/KeyringExtension
