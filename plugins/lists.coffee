# A plugin to get lists of content from "lists" folder in the "content" directory.
# Currently has single-level nesting of lists. Maybe this will change in the future?

module.exports = (env, callback) ->

  getLists = (contents, options) ->
    if options == undefined then options = {}
    lists = {}
    if content['lists']?
      for listName, data of contents['lists']
        unless isHiddenFile(listName)
          options.listName = listName
          lists[listName] = getList(contents, options)
    lists

  getList = (contents, options) ->
    if contents['lists']?
      if contents['lists'][options.listName]?
        list = []
        for itemName, item of contents['lists'][options.listName]
          unless isHiddenFile(itemName)
            list.push item
        list = sortList list, options
        list
      else
        []
    else
      []

  sortList = (list, options) ->
    if options.sort?
      list = list.sort (a, b) ->
        aVal = a.metadata[options.sort]
        bVal = b.metadata[options.sort]
        if not aVal and not bVal
          result = 0
        else if not aVal
          result = -1
        else if not bVal
          result = 1
        else if aVal > bVal
          result = 1
        else if aVal < bVal
          result = -1
        else
          result = 0
        if options.sortDescending? and options.sortDescending == 'true'
          result = result*-1
        result
    else
      list

  isHiddenFile = (fileName) ->
    fileName.indexOf('.') == 0


  env.helpers.getList = getList
  callback()
