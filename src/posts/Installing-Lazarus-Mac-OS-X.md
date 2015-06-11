---
lang: en
title: Installing Lazarus on Mac OS X.
keywords: Lazarus, Pascal, installing, installation, Mac OS X, gdb, brew
date: 2015-06-11
author: Phil Rigovanov
template: post.jade
---

[Lazaruz](http://www.lazarus-ide.org/) is open sourced cross-platform IDE for [Pascal programming language](https://en.wikipedia.org/wiki/Pascal_%28programming_language%29).
Before you begin [Lazaruz installation](http://wiki.lazarus.freepascal.org/Installing_Lazarus_on_MacOS_X), you must have [gdb](http://www.gnu.org/software/gdb/) installed. Mac OS X users can install it by using [brew](http://brew.sh/) utility. Just type this command in terminal application:

```
$ brew install homebrew/dupes/gdb
```

After that, simply [download](http://sourceforge.net/projects/lazarus/files/Lazarus%20Mac%20OS%20X%20i386/) three disk images \(`.dmg` files\) for ***fpc***, ***fpcsrc*** and ***Lazarus***, open up each disk image and install in this order:

1. ***fpc***
2. ***fpcsrc***
3. ***Lazarus***

Thats all. Happy programming!
