gulp = require 'gulp'

config =
  root: "/app/project"
  src: ["server", "common"]
  dist: "/app/dist"

try require('./project/hooks/gulp') config
require('./gulp')(gulp, config)
return gulp
