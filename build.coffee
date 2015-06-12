metalsmith = require 'metalsmith'
drafts = require 'metalsmith-drafts'
define = require 'metalsmith-define'
markdown = require 'metalsmith-markdown'
asciidoc = require 'metalsmith-asciidoc'
templates = require 'metalsmith-templates'
permalinks = require 'metalsmith-permalinks'
collections = require 'metalsmith-collections'
autoprefixer = require 'metalsmith-autoprefixer'
pagination = require 'metalsmith-pagination'
date = require 'metalsmith-build-date'
snippet = require 'metalsmith-snippet'
sitemap = require 'metalsmith-sitemap'
assets = require 'metalsmith-assets'
feed = require 'metalsmith-feed'

fixPath = () ->
  (files, metalsmith, done) ->
    for file of files
      unless files[file].title == undefined
        files[file].path += '/'
    done()
    return

metalsmith __dirname
  .source 'src'
  .use date()
  .use define require './config/define'
  .use collections require './config/collections'
  .use pagination require './config/pagination'
  .use markdown require './config/markdown'
  .use asciidoc()
  .use drafts()
  .use snippet require './config/snippet'
  .use permalinks()
  .use autoprefixer()
  .use feed require './config/feed'
  .use templates require './config/templates'
  .use fixPath()
  .use sitemap require './config/sitemap'
  .use assets()
  .destination 'build'
  .build (err,files) ->
    myc=0
    for file of files
      unless files[file].title == undefined
        console.log("Path: ", files[file].path,", Title:", files[file].title)
        myc+=1
    console.log("There are ", myc, " defined files")
    if err
      throw err
    return
