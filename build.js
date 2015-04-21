var metalsmith  = require('metalsmith'),
  drafts        = require('metalsmith-drafts'),
  markdown      = require('metalsmith-markdown'),
  templates     = require('metalsmith-templates'),
  permalinks    = require('metalsmith-permalinks'),
  collections   = require('metalsmith-collections'),
  date          = require('metalsmith-build-date'),
  define        = require('metalsmith-define'),
  autoprefixer  = require('metalsmith-autoprefixer'),
  pagination    = require('metalsmith-pagination'),
  snippet       = require('metalsmith-snippet'),
  sitemap       = require('metalsmith-sitemap');

  metalsmith(__dirname)
    .source('src')
    .use(define(require('./config/define')))
    .use(collections(require('./config/collections')))
    .use(pagination(require('./config/pagination')))
    .use(markdown(require('./config/markdown')))
    .use(date())
    .use(drafts())
    .use(snippet(require('./config/snippet')))
    .use(permalinks())
    .use(autoprefixer())
    .use(templates(require('./config/templates')))
    .use(sitemap(require('./config/sitemap')))
    .destination('build')
    .build(function (err) {
    if (err) {
      throw err;
    }
  });
