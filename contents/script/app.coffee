nnmForEach = (nodeMap, cb) ->
  for i in [0..nodeMap.length - 1]
    cb nodeMap.item(i)

addExternalLinks = ->
  externalLinks = document.querySelectorAll 'a[href^=\'http\']'

  nnmForEach externalLinks, (element) ->
    element.target = '_blank'

addVimeoEvents = ->
  vimeoElements = document.querySelectorAll '.media.vimeo'

  vimeoElementClick = ->
    @innerHTML = "<iframe src=\"//player.vimeo.com/video/#{@getAttribute('data-vimeoId')}?autoplay=1\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>"

  nnmForEach vimeoElements, (element) ->
    element.onclick = vimeoElementClick

  resizeVideos = ->
    nnmForEach vimeoElements, (element) ->
      ratio = element.getAttribute('data-ratio')
      if ratio?
        [width, height] = ratio.split ':'
        quotient = height/width
        newHeight = element.offsetWidth*quotient + "px"
        element.style.height = newHeight

  resizeVideos()
  window.onresize = resizeVideos

addMediaLinks = ->
  addVimeoEvents()

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
