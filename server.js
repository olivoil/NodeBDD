var app = require('./app');

// run HTTP Server
app.run({
    port: parseInt(process.argv[2] || 3000, 10)
  , home: process.cwd()
});
