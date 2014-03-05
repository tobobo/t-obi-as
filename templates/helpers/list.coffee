Handlebars = require 'handlebars'
# A handlebars helper to display the contents of a list

module.exports = (env, contents, options) ->

  out = "<ul class=\"#{options.hash.listName} list-helper\">"

  for item in env.helpers.getList(contents, options.hash)
    clickable = if item.metadata.link? then 'clickable' else ''
    if options.fn?
      content = options.fn item
    else
      content = item.html

    out += "<li class=\"#{clickable}\">#{content}</li>"

  out += "</ul>"

  new Handlebars.SafeString unescape(out)
