fs = require 'fs'

module.exports = (_gulp, config) ->
  gulp = require('gulp-help') _gulp

  fileTypes = ['coffee', 'css', 'html', 'ts', 'js', 'es6', 'json']

  for name in fileTypes
    gulp.task name, require("./#{name}")(gulp, config)

  gulp.task 'compile', fileTypes
  
  gulp.task 'build', ['compile']
  
  gulp.task 'default', ['build'], ->
    gulp.start 'watch'

  gulp.task 'watch', require('./watch')(gulp, config)

  # Configure the hooks
  if fs.existsSync '/app/hooks/gulp/'
    console.log "Executing the gulp hooks..."
    require('/app/hooks/gulp/') gulp, config
  else
    console.log "There are no gulp hooks, skipping."

  return gulp
