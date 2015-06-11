metalsmith = require('metalsmith')
drafts = require('metalsmith-drafts')
markdown = require('metalsmith-markdown')
asciidoc = require('metalsmith-asciidoc')
templates = require('metalsmith-templates')
permalinks = require('metalsmith-permalinks')
collections = require('metalsmith-collections')
date = require('metalsmith-build-date')
define = require('metalsmith-define')
autoprefixer = require('metalsmith-autoprefixer')
pagination = require('metalsmith-pagination')
snippet = require('metalsmith-snippet')
sitemap = require('metalsmith-sitemap')
assets = require('metalsmith-assets')

fixPath = (prop, val) ->
  (files, metalsmith, done) ->
    for file of files
      if files[file][prop] == val
        files[file].path = '/'
    done()
    return

metalsmith(__dirname)
  .source('src')
  .use(define(require('./config/define')))
  .use(collections(require('./config/collections')))
  .use(pagination(require('./config/pagination')))
  .use(markdown(require('./config/markdown')))
  .use(asciidoc())
  .use(date())
  .use(drafts())
  .use(snippet(require('./config/snippet')))
  .use(permalinks())
  .use(autoprefixer())
  .use(templates(require('./config/templates')))
  .use(fixPath('path', ''))
  .use(sitemap(require('./config/sitemap')))
  .use(assets())
  .destination('build')
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
