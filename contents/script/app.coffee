nnmForEach = (nodeMap, cb) ->
  for i in [0..nodeMap.length - 1]
    cb nodeMap.item(i)

addExternalLinks = ->
  externalLinks = document.querySelectorAll 'a[href^=\'http\']'

  nnmForEach externalLinks, (element) ->
    element.target = '_blank'


addListItemLinks = ->
  listHelperItems = document.querySelectorAll 'ul.list-helper li'

  getTitleLink = (element) ->
    element.querySelectorAll('a.title')[0]

  listHelperClick = (e) ->
    unless e.target.tagName == 'A'
      titleLink = getTitleLink @
      if titleLink?
        window.open titleLink.href

  nnmForEach listHelperItems, (element) ->
    element.onclick = listHelperClick


init = (->
  addExternalLinks()
  addListItemLinks()
  addMediaLinks()
)()
