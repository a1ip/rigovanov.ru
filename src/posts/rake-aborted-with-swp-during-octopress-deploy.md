---
layout: post
title: "Exclude .swp files during Octopress deploy"
date: 2014-07-11 12:34:27 +0400
comments: true
categories: [error, ruby, octopress, deploying, rake, vim]
template: post.jade
---

Я пользуюсь редактором [Vim](http://www.vim.org) для того чтобы писать в своём блоге [powered by Octopress](http://octopress.org).

У меня вылезла ошибка связанная с тем, что ``copydot`` не игнорирует ``.swp`` файлы временных копий для _vim_:

>cp -r source/_posts/.2014-05-06-page.md.swp public/_posts/.2014-05-06-page.md.swp

>rake aborted!

>No such file or directory @ rb_sysopen - public/_posts/.2014-05-06-page.md.swp
>
>Tasks: TOP => copydot

Проблема решается например добавлением ``, "**/.*.swp*"`` в файле ``Rakefile``.
``` ruby Rakefile
desc "copy dot files for deployment"
task :copydot, :source, :dest do |t, args|
  FileList["#{args.source}/**/.*"].exclude("**/.", "**/..", "**/.DS_Store", "**/._*", "**/.*.swp*").each do |file|
    cp_r file, file.gsub(/#{args.source}/, "#{args.dest}") unless File.directory?(file)
  end
end
```
