package = require('../../package.json')
url = require 'url'

module.exports = ->
  if package.repository? and package.repository.url?
    repositoryUrl = url.parse package.repository.url
    "http://" + repositoryUrl.host + repositoryUrl.pathname.split('.').slice(0,-1).join('.')
  else
    ""
  
