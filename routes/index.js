var express = require('express'),
  router = express.Router(),
  GoogleURL = require('google-url'), // google url module
  mysql = require('mysql'), //mysql module
  eventEmitter = require('events').EventEmitter;

// configuring google url shortener api with your api key  
var googleUrl = new GoogleURL({ key: 'INSERT YOUR API KEY HERE' }); // insert your api key

// mysql database connection
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root', // supply your mysql username
  password : '', // supply your mysql password
  database : 'url_shortener'
});

//connecting to mysql
connection.connect();

// creating a new emitter for our app
var URLShortenerEmitter = new eventEmitter();

// event handler that handles mysql inserts
URLShortenerEmitter.on('mysqlInsert', function(data) {
    connection.query('insert into urls SET ?', data, function(err, result) {
      if(err) {
        console.error("Failed to insert");
      } else {
        console.log('Successfully inserted');
      }
    });
});

// handling get request for home page
router.get('/', function(req, res, next) {
  res.render('index');
});

// handling post request for home page
router.post('/', function(req, res, next) {
  var url = req.body.url;
  googleUrl.shorten(url, function(err, shortUrl) {
    if(err) {
      console.error("Failed to shorten URL");
    } else {
      var data = { long_url: url, short_url: shortUrl };
      URLShortenerEmitter.emit('mysqlInsert', data);
      console.log("URL shortening successful")
      res.render('index', {
        url: url,
        short_url: shortUrl
      });
    }
  });
});

// handling get request for url list page
router.get('/list', function(req, res, next) {
  connection.query('SELECT long_url, short_url FROM urls', function(err, rows, fields) {
    if(err) {
      console.error("Failed to get data from database");
    } else {
      res.render('list', {
        urls: rows
      });
    }
  });
});

module.exports = router;
