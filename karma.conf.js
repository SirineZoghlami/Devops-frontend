module.exports = function(config) {
    config.set({
      frameworks: ['jasmine'],
  
      plugins: [
        require('karma-jasmine'),
        require('karma-chrome-launcher'),
        require('karma-jasmine-html-reporter')
      ],
  
      client: {
        clearContext: false // leave Jasmine Spec Runner output visible in browser
      },
  
      reporters: ['progress', 'kjhtml'],
  
      // File patterns for the tests
      files: [
        // Relative path to the test file
        'src/app/**/*.spec.ts'
      ],
  
      port: 9876,
      colors: true,
      logLevel: config.LOG_INFO,
      autoWatch: true,
      browsers: ['Chrome'],
      singleRun: false,
      restartOnFileChange: true
    });
  };
  