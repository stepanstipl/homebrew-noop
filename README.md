stepanstipl/noop
=============


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
- _Please make sure python can find libxml2 module. There's couple of ways to achieve that, libxml2 module should give you relevant hint when installing. One of the ways that might work for you:
  `echo $(brew --prefix)/opt/libxml2/lib/python2.7/site-packages >> $(brew --prefix)/lib/python2.7/site-packages/libxml2.pth`_

### yum-metadata-parser (http://yum.baseurl.org/)
- Fast yum metadata parser in C. Dependency for createrepo. 
- Version 1.1.4.


### rpm4 (http://www.rpm.org/)
- Classical rpm tool - version 4, version used by main Linux distributions like RHEL, CentOS and Fedora (default one in Homebrew is rpm5, but that one does not have python bindings required by createrepo).
- _This one conflicts with default rpm_.
- Version 4.12.0.1

Issues:
-------
Please use GitHub's issue tracker for reporting issues and eventually any suggestions etc. Please, please follow Homebrew's section Troubleshooting before you report any issue https://github.com/Homebrew/homebrew#troubleshooting.

sqlite3 needs to be installed and **linked**, else pkg-config fails and makes whole python setup.py build step to fail

License:
--------
Released under [MIT License](https://github.com/stepanstipl/homebrew-noop/blob/master/LICENSE.md). Feel free to redistribute and contribute!

Todo:
-----
- Add Travis CI tests
- Maybe "Who are you?" section
