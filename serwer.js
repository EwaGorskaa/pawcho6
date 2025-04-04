const express = require('express');
const os = require("os");
const app = express();

app.get('/', (req, res) => {
  res.setHeader("Content-Type", "text/plain");
  res.send(`hostname: ${os.hostname} \nip: ${req.socket.localAddress} \nversion ${process.env.VERSION}`);
});

app.listen(5000, () => {
  console.log('Listening on port 5000');
});