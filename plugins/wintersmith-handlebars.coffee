wsHbs = require '../node_modules/wintersmith-handlebars/wintersmith-handlebars.coffee'

module.exports = (env, callback) ->
  wsHbs env, ->

    HandlebarsHelperClass = null
    newPattern = null
    
    env.templatePlugins.forEach (plugin) ->
      if plugin.class.toString().indexOf('HandlebarsHelper') > -1
        HandlebarsHelperClass = plugin.class
        split = plugin.pattern.split('*')
        if split.length > 1
          newPattern = split.slice(0,-1).join('*') + '*(js|coffee)'

    if HandlebarsHelperClass? and newPattern?
      env.registerTemplatePlugin newPattern, HandlebarsHelperClass

    callback()
