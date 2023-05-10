'use strict';
const http = require('http');
const fs = require('fs');
const url = require('url');

async function gateWayPage(req, res) {
  const pathname = url.parse(req.url).pathname;

  const ext = pathname.split('.').pop();

  let contentType = 'text/html';
  if (ext === 'css') {
    contentType = 'text/css';
  }

  let filepath = '.' + pathname;
  if (ext === 'css') {
    filepath = './' + pathname;
  }

  fs.readFile(filepath, async function (err, data) {
    if (err) {
      res.writeHead(404, { 'Content-Type': 'text/html' });
      return res.end('404 Not Found');
    }
    res.writeHead(200, { 'Content-Type': contentType });
    res.write(data);
    return res.end();
  });
}

http.createServer(gateWayPage).listen(8080);