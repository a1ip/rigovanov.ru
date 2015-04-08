var metalsmith  = require('metalsmith'),
  drafts        = require('metalsmith-drafts'),
  markdown      = require('metalsmith-markdown'),
  highlight     = require('highlight.js'),
  templates     = require('metalsmith-templates'),
  permalinks    = require('metalsmith-permalinks'),
  collections   = require('metalsmith-collections'),
  date          = require('metalsmith-build-date'),
  define        = require('metalsmith-define'),
  autoprefixer  = require('metalsmith-autoprefixer'),
  pagination    = require('metalsmith-pagination'),
  snippet       = require('metalsmith-snippet');

  metalsmith(__dirname)
    .source('src')
    .use(define({
    blog: {
      uri: 'http://rigovanov.ru',
      title: 'Phil Rigovanov',
      description: 'My blog'
    },
    owner: {
      uri: 'http://phil.rigovanov.ru',
      name: 'Phil Rigovanov'
    },
    moment: require('moment')
  }))
    .use(collections({
      articles: {
        pattern: 'posts/**/*.md',
        sortBy: 'date',
        reverse: true
      }
    }))
    .use(pagination({
      'collections.articles': {
        perPage: 5,
        template: 'index.jade',
        first: 'index.html',
        path: 'page/:num/index.html',
        pageMetadata: {
          title: 'Archive'
        }
      }
    }))
    .use(markdown({
      gfm: true,
      tables: true,
      highlight: function (code, lang) {
        if (!lang) {
          return code;
        }

        try {
          return highlight.highlight(lang, code).value;
        } catch (e) {
          return code;
        }
    }}))
    .use(date())
    .use(drafts())
    .use(snippet({
      maxLength: 250,
      suffix: '...'
    }))
    .use(permalinks())
    .use(autoprefixer())
    .use(templates({
    engine: 'jade',
    directory: 'templates'
  }))
    .destination('build')
    .build(function (err) {
    if (err) {
      throw err;
    }
  });
