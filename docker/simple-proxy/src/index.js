'use strict';

const express = require('express');
const body_parser = require('body-parser');

const app = express();
const port = 4567;

app.use(body_parser.json());

app.post('/buy', (req, res) => {
    const tx = req.body;
    console.log(tx);
    res.end();
});

app.listen(port, _ => console.log(`mocking proxy server is running on port ${port}`));
