Handlebars = require 'handlebars'

module.exports = (env, contents, bandcampData, options) ->
  if bandcampData
    """
    <div class="media">
      <iframe class="bandcamp-embed" style=\"border: 0; width: 100%; height: 42px;\" src=\"http://bandcamp.com/EmbeddedPlayer#{bandcampData}size=small/tracklist=false/artwork=false/transparent=true/\" seamless></iframe>
    </div>
    """
  else
    ""
