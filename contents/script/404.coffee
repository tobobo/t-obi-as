path = window.location.pathname
newHost = "http://hosted-by-t.obi.as"
url = "#{newHost}#{path}"

statusEl = document.getElementById('status')
urlElement = document.getElementById('redirect-url')
urlElement.innerHTML = url

checkUrl = (url, callback) ->

  if arguments.length < 2
    throw "Must provide url and callback."
  else if url.match(/.js$/)?
    throw "Cannot test javascript files."

  separator = if url.indexOf('?') > -1 then '&' else '?'
  url = url + separator + (new Date).getTime()

  script = document.createElement 'script'
  script.src = url
  document.getElementsByTagName('body')[0].appendChild script

  script.onload = ->
    callback true
  script.onerror = ->
    callback false

checkUrl url, (success) ->
  if success
    statusEl.innerHTML = """
      Redirecting you to <span class="redirect-url">#{url}</span>...
    """
    window.location = url
  else
    statusEl.innerHTML = """
      <span class="redirect-url">#{window.location}</span> was not found.
    """
