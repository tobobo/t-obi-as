module.exports = (env, callback) ->

  getLists = (contents, options) ->
    if options == undefined then options = {}
    lists = {}
    if content['lists']?
      for listName, data of contents['lists']
        unless listName.indexOf('.') == 0
          options.listName = listName
          lists[listName] = getList(contents, options)
    lists

  getList = (contents, options) ->
    if contents['lists']?
      if contents['lists'][options.listName]?
        list = []
        for itemName, item of contents['lists'][options.listName]
          unless itemName.indexOf('.') == 0
            list.push item
            
        if options.sort? and options.sort == 'true'
          list = list.sort (a, b) ->
            aVal = a.metadata[options.sort]
            bVal = b.metadata[options.sort]
            if not aVal and not bVal
              result = 0
            else if not aVal
              result = 1
            else if not bVal
              result = -1
            else if aVal > bVal
              result = 1
            else if aVal < bVal
              result = -1
            else
              result = 0
            if options.sortDescending? and options.sortDescending == 'true'
              result = result*-1
            result

        list
      else
        []
    else
      []

  env.helpers.getList = getList
  callback()
