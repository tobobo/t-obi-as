Handlebars = require 'handlebars'

module.exports = (vimeoId, options) ->
  if vimeoId
    """
    <div class="media vimeo-wrapper">
      <div class="media vimeo" data-vimeoId="#{vimeoId}" data-ratio="#{options.hash.ratio}">
        <a class="play-button"></a>
      </div>
    </div>
    """
  else
    ""
