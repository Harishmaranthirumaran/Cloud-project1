const http = require('http');

const server = http.createServer((_req, res) => {
  res.writeHead(200, { 'content-type': 'application/json' });
  res.end(JSON.stringify({ ok: true }));
});

server.listen(process.env.PORT || 3000);

