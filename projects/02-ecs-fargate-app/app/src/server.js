const express = require('express');

const app = express();
const port = process.env.PORT || 3000;

app.get('/health', (_req, res) => {
  res.json({ status: 'ok', service: 'ecs-fargate-app' });
});

app.get('/', (_req, res) => {
  res.json({
    message: 'Hello from ECS Fargate',
    environment: process.env.NODE_ENV || 'development',
  });
});

app.listen(port, () => {
  console.log(`Server listening on ${port}`);
});

