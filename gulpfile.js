'use strict';

var gulp = require('gulp');
var wrench = require('wrench');

wrench.readdirSyncRecursive('./exchange_admin/gulp').filter(function(file) {
  return (/\.(js|coffee)$/i).test(file);
}).map(function(file) {
  require('./exchange_admin/gulp/' + file);
});

gulp.task('default', ['clean'], function () {
  gulp.start('full-build');
});
