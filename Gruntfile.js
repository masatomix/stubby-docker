module.exports = function (grunt) {
  // Load grunt tasks automatically
  require('load-grunt-tasks')(grunt);

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
  });

  grunt.loadTasks('grunt');
  grunt.registerTask('serve', 'run mock server',function(target){
    grunt.task.run([
      'stubby'
    ]);
  });
  grunt.registerTask('default', ['stubby']);
}

