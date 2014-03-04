wsHbs = require '../node_modules/wintersmith-handlebars/wintersmith-handlebars.coffee'
require 'array.prototype.findindex'

module.exports = (env, callback) ->
  wsHbs env, ->


    # get template plugin for handlebars helpers
    
    oldIndex = env.templatePlugins.findIndex (plugin, index) ->
      if plugin.class.toString().indexOf('HandlebarsHelper') > -1
        oldIndex = index
        true


    # change it to allow coffeescript helpers

    if oldIndex?
      oldPlugin = env.templatePlugins.splice(oldIndex)[0]
      env.registerTemplatePlugin(
        oldPlugin.pattern.split('*').slice(0,-1).join('*') + '*(js|coffee)',
        oldPlugin.class
      )

    callback()
