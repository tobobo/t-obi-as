listHelperItems = document.querySelectorAll 'ul.list-helper li'

getTitleLink = (element) ->
  element.querySelectorAll('a.title')[0]

listHelperClick = (e) ->
  unless e.target.tagName == 'A'
    titleLink = getTitleLink @
    if titleLink?
      window.open titleLink.href

for i in [0..listHelperItems.length - 1]
  listHelperItems.item(i).onclick = listHelperClick
