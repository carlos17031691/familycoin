Familycoin Core
=============

Setup
---------------------
Familycoin Core is the original Familycoin client and it builds the backbone of the network. It downloads and, by default, stores the entire history of Familycoin transactions (which is currently more than 100 GBs); depending on the speed of your computer and network connection, the synchronization process can take anywhere from a few hours to a day or more.

To download Familycoin Core, visit [familycoincore.org](https://familycoincore.org/en/releases/).

Running
---------------------
The following are some helpful notes on how to run Familycoin Core on your native platform.

### Unix

Unpack the files into a directory and run:

- `bin/familycoin-qt` (GUI) or
- `bin/familycoind` (headless)

### Windows

Unpack the files into a directory, and then run familycoin-qt.exe.

### macOS

Drag Familycoin Core to your applications folder, and then run Familycoin Core.

### Need Help?

* See the documentation at the [Familycoin Wiki](https://en.familycoin.it/wiki/Main_Page)
for help and more information.
* Ask for help on [#familycoin](http://webchat.freenode.net?channels=familycoin) on Freenode. If you don't have an IRC client use [webchat here](http://webchat.freenode.net?channels=familycoin).
* Ask for help on the [FamilycoinTalk](https://familycointalk.org/) forums, in the [Technical Support board](https://familycointalk.org/index.php?board=4.0).

Building
---------------------
The following are developer notes on how to build Familycoin Core on your native platform. They are not complete guides, but include notes on the necessary libraries, compile flags, etc.

- [Dependencies](dependencies.md)
- [macOS Build Notes](build-osx.md)
- [Unix Build Notes](build-unix.md)
- [Windows Build Notes](build-windows.md)
- [OpenBSD Build Notes](build-openbsd.md)
- [NetBSD Build Notes](build-netbsd.md)
- [Gitian Building Guide](gitian-building.md)

Development
---------------------
The Familycoin repo's [root README](/README.md) contains relevant information on the development process and automated testing.

- [Developer Notes](developer-notes.md)
- [Release Notes](release-notes.md)
- [Release Process](release-process.md)
- [Source Code Documentation (External Link)](https://dev.visucore.com/familycoin/doxygen/)
- [Translation Process](translation_process.md)
- [Translation Strings Policy](translation_strings_policy.md)
- [Travis CI](travis-ci.md)
- [Unauthenticated REST Interface](REST-interface.md)
- [Shared Libraries](shared-libraries.md)
- [BIPS](bips.md)
- [Dnsseed Policy](dnsseed-policy.md)
- [Benchmarking](benchmarking.md)

### Resources
* Discuss on the [FamilycoinTalk](https://familycointalk.org/) forums, in the [Development & Technical Discussion board](https://familycointalk.org/index.php?board=6.0).
* Discuss project-specific development on #familycoin-core-dev on Freenode. If you don't have an IRC client use [webchat here](http://webchat.freenode.net/?channels=familycoin-core-dev).
* Discuss general Familycoin development on #familycoin-dev on Freenode. If you don't have an IRC client use [webchat here](http://webchat.freenode.net/?channels=familycoin-dev).

### Miscellaneous
- [Assets Attribution](assets-attribution.md)
- [Files](files.md)
- [Fuzz-testing](fuzzing.md)
- [Reduce Traffic](reduce-traffic.md)
- [Tor Support](tor.md)
- [Init Scripts (systemd/upstart/openrc)](init.md)
- [ZMQ](zmq.md)

License
---------------------
Distributed under the [MIT software license](/COPYING).
This product includes software developed by the OpenSSL Project for use in the [OpenSSL Toolkit](https://www.openssl.org/). This product includes
cryptographic software written by Eric Young ([eay@cryptsoft.com](mailto:eay@cryptsoft.com)), and UPnP software written by Thomas Bernard.
