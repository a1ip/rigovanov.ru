pkg = require '../package.json'
siteConfig =
  avatarUrl: '/assets/img/avatar.png'
  buildDate: new Date
  integrations:
    disqus: 'a1ip'
    analytics: 'UA-26406005-6'
  gaId: 'UA-26406005-6'
  owner:
    uri: 'http://phil.rigovanov.ru'
    name: 'Phil Rigovanov'
  lang: 'ru'
  moment: require('moment')
  pkg: pkg
  site:
    url: pkg.homepage
    title: 'Phil Rigovanov'
    description: 'The personal blog of Phil Rigovanov mostly about religion'
    keywords: 'Phil Rigovanov, blog'
    rss: '/feed.xml'
    meta: [
      {
        name: 'author'
        content: pkg.author.name
      }
      {
        name: 'twitter:site'
        content: '@phil_rigovanov'
      }
    ]
module.exports = siteConfig
