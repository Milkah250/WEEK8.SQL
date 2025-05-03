const express = require('express');
const path = require('path');
const cors = require('cors');
const mongoose = require('mongoose');
const dotenv = require('dotenv').config(); // For loading .env file

// Database connection
mongoose.connect(process.env.DB_URL, { useNewUrlParser: true, useUnifiedTopology: true }).then(() => console.log('Connected to database')).catch(err => console.log(err));

const app = express();
app.use(cors());
app.use(express.json());

// Register routes
require('./routes/books')(app, mongoose);
require('./routes/authors')(app, mongoose);

app.listen(process.env.PORT || 3000, () => console.log('Server started on port ' + process.env.PORT || 3000));
