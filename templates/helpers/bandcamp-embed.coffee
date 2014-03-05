Handlebars = require 'handlebars'

module.exports = (env, contents, bandcampData, options) ->
  if bandcampData
    """
    <div class="media bandcamp-wrapper">
      <div class="media bandcamp">
        <iframe class="bandcamp-embed" src=\"http://bandcamp.com/EmbeddedPlayer#{bandcampData}size=small/tracklist=false/artwork=false/transparent=true/\" seamless></iframe>
      </div>
    </div>
    """
  else
    ""
