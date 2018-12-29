---
lang: ru
title: Резюме в LaTeX
date: 2011-03-27
description: Резюме в LaTeX на русском, решение проблемы с кодировкой
keywords: резюме, LaTeX, шаблон, файл, curriculum vitae, кодировка, локализация, юникод, utf8, пакет, проблемы, Ubuntu, tex
author: Phil Rigovanov
template: post.jade
---

Для того чтобы при оформлении использовать класс [moderncv](http://www.ctan.org/tex-archive/macros/latex/contrib/moderncv/), нужно скачать пакет [moderncv.zip](http://mirror.ctan.org/macros/latex/contrib/moderncv.zip), распаковать, а _.tex_ файл с вашим резюме должен находиться в той же директории что и файл _moderncv.cls_   и файлы _.sty_ .
 У меня в _Ubuntu_ уже был установлен пакет _texlive-latex-extra_, который содержит в том числе и _moderncv_, поэтому я просто распаковал файл _template_en.tex.gz_ командой:

     $ gunzip -c /usr/share/doc/texlive-latex-extra-doc/latex/moderncv/examples/template_en.tex.gz > /home/user/cv/template_en.tex

и редактировал его.

 Я повсеместно использую юникод, и _.tex_ файл моего curriculum vitae тоже сохранил в _utf8_.
Но _LaTeX_ при обработке моего _.tex_ файла выдал ошибку:

    ! LaTeX Error: Command \CYRF unavailable in encoding T1

Решением проблемы оказалось добавление в преамбуле документа следующих команд:

    \usepackage[utf8]{inputenc}           % кодировка
    \usepackage[T2A]{fontenc}             % кодировка исходного текста
    \usepackage[english,russian]{babel}   % локализация и переносы

Кстати, недавно нашёл здесь https://www.overleaf.com/gallery/tagged/cv шикарную коллекцию шаблонов для резюме в LaTeX.
