module.exports = {
  ignoreFiles: [/test.xml/], // Matched files will be ignored
  output: 'sitemap.xml', // The location where the final sitemap should be placed
  // urlProperty: 'seo.canonical', // Key for URL property
  hostname: 'http://rigovanov.ru', // hostname to use for URL, if needed
  modifiedProperty: 'modified', // Key for last modified property
  defaults: { // You can provide default values for any property in here
    priority: 0.5,
    changefreq: 'weekly'
  }
}
