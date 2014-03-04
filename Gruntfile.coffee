module.exports = (grunt) ->

  #Config

  grunt.initConfig
    s3:
      options:
        key: process.env.TOBIAS_AWS_ACCESS_KEY_ID
        secret: process.env.TOBIAS_AWS_SECRET_ACCESS_KEY
        bucket: process.env.TOBIAS_AWS_BUCKET
        region: process.env.TOBIAS_AWS_REGION
        gzip: true
        access: "public-read"
      deploy:
        upload: [
          src: 'build/**/*'
          rel: 'build/'
        ]

    wintersmith:
      build: {}
      preview:
        options:
          action: "preview"
  
  # Load NPM Tasks
  grunt.loadNpmTasks "grunt-wintersmith"
  grunt.loadNpmTasks "grunt-s3"

  
  # Register Tasks

  grunt.registerTask 'build', [
    'wintersmith:build'
  ]

  grunt.registerTask 'upload', [
    's3'
  ]

  grunt.registerTask 'deploy', [
    'build',
    'upload'
  ]
