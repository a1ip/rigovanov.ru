---
lang: ru
title: "Page build failed during Octopress deploy"
date: 2014-05-06
comments: true
description: Error "Page build failed" during blog powered by Octopress deploy
categories: [error, ruby, octopress, deploying, rake, Github Pages]
template: post.jade
---

В какой-то момент у меня возникли проблемы с размещением моего [powered by Octopress](http://octopress.org) блога на [Github Pages](https://pages.github.com/):

>The page build failed with the following error:
>
>Page build failed.

Благодарю автора статьи [Adventures in Ruby](http://warewolf.github.io/blog/2013/04/28/adventures-in-ruby/), проблема решилась закомментированием строчки ``require "bundler/setup"`` в файле ``Rakefile``.
