const http = require('http');

http.createServer((_req, res) => {
  res.writeHead(200, { 'content-type': 'application/json' });
  res.end(JSON.stringify({ service: 'sample-api', ok: true }));
}).listen(process.env.PORT || 3000);

