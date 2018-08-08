stepanstipl/noop
=============

**This repo is not maintained anymore, I would recommend using docker for rpm related stuff, for example `stepanstipl/centos7-rpm-devtools` image.**

_Stepan's personal tap for homebrew formulae_

This tap was originally created when I've decided to move from MacPorts (http://www.macports.org/) to Homebrew (http://brew.sh/) and one major things that I was immediately missing was [**createrepo**](http://createrepo.baseurl.org/) tool for generating rpm repositories metadata.


How do I install these?
-----------------------
- I suppose you have Homebrew installed (if not follow instructions at http://brew.sh/)
- Add this tap: `brew tap stepanstipl/noop`
- Install what you want: `brew install <formula>`


Formulae in this tap:
---------------------

### createrepo (http://createrepo.baseurl.org/)
- Createrepo tool for generating rpm repositories metadata.
- Latest stable version 0.4.11.
- After installing libxml2, make sure it's symlinked to /usr/local:
  - `echo /usr/local/opt/libxml2/lib/python2.7/site-packages >> /usr/local/lib/python2.7/site-packages/libxml2.pth`

### yum-metadata-parser (http://yum.baseurl.org/)
- Fast yum metadata parser in C. Dependency for createrepo. 
- Version 1.1.4.

### rpm4 (http://www.rpm.org/)
- Classical rpm tool - version 4, version used by main Linux distributions like RHEL, CentOS and Fedora (default one in Homebrew is rpm5, but that one does not have python bindings required by createrepo).
- _This one conflicts with default rpm_.
- Version 4.14.1
- If you're using system Python, make sure Homebre's site-packages are added to your Python sys.path:
  - `mkdir -p /Users/$(whoami)/Library/Python/2.7/lib/python/site-packages`
  - `echo 'import site; site.addsitedir("/usr/local/lib/python2.7/site-packages")' >> /Users/$(whoami)/Library/Python/2.7/lib/python/site-packages/homebrew.pth`

### rpmlint (http://sourceforge.net/projects/rpmlint/)
- Tool for checking common errors in rpm packages.
- Version 1.6.

Caveats:
--------
- If you're using system Python, make sure Homebrew's site-packages are added to your Python sys.path:
  - `mkdir -p /Users/$(whoami)/Library/Python/2.7/lib/python/site-packages`
  - `echo 'import site; site.addsitedir("/usr/local/lib/python2.7/site-packages")' >> /Users/$(whoami)/Library/Python/2.7/lib/python/site-packages/homebrew.pth`
- After installing libxml2, make sure it's symlinked to /usr/local:
  - `echo /usr/local/opt/libxml2/lib/python2.7/site-packages >> /usr/local/lib/python2.7/site-packages/libxml2.pth`

Issues:
-------
Please use GitHub's issue tracker for reporting issues and eventually any suggestions etc. Please, please follow Homebrew's section Troubleshooting before you report any issue https://github.com/Homebrew/homebrew#troubleshooting.

License:
--------
Released under [MIT License](https://github.com/stepanstipl/homebrew-noop/blob/master/LICENSE.md). Feel free to redistribute and contribute!

Todo:
-----
- Add Travis CI tests
- Maybe "Who are you?" section
- Tests in Vagrant
- See about homebrew python vs. system
