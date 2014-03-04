# A handlebars helper to display the contents of a list

module.exports = (env, contents, options) ->

  out = "<ul class=\"#{options.hash.listName} list-helper\">"

  for item in env.helpers.getList(contents, options.hash)
    if options.fn?
      content = options.fn item
    else
      content = item.html

    out += "<li class=\"list-helper-item\">#{content}</li>"

  out += "</ul>"
