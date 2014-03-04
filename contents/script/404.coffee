path = window.location.pathname
newHost = "http://hosted-by-t.obi.as"
url = "#{newHost}#{path}"

checkUrl = (url, callback) ->
  if arguments.length < 2
    throw "Must provide url and callback."
  else if url.match(/.js$/)?
    throw "Cannot test javascript files."

  script = document.createElement 'script'
  script.src = url
  document.getElementsByTagName('head')[0].appendChild script

  script.onload = ->
    callback true
  script.onerror = ->
    callback false

checkUrl url, (success) ->
  if success
    window.location = url
  else
    console.log 'Really a 404'
