var app = require('./app/app')
  , winston = require('winston')
  , logger;

// Logger
exports.logger = logger = new (winston.Logger)({
  levels: {
    http   : 0
  },
  colors: {
    http: 'blue'
  },
  transports: [
      new winston.transports.Console({
          level: 'http'
        , colorize: true
        , timestamp: true
      })
    , new (winston.transports.File)({
          filename: "./log/" + (process.env.NODE_ENV || 'development') + ".log"
        , level: 'http'
    })
  ]
});

if (process.env.NODE_ENV == 'production' || process.env.NODE_ENV == 'test'){
  logger.remove(winston.transports.Console);
};

// run HTTP Server
exports.app = app.run({
    port: parseInt(process.argv[2] || 3000, 10)
  , home: process.cwd()
  , logger: logger
});

// configure socket.io, background jobs, and other concerns...
