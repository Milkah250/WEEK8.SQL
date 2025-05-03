# WEEK8.SQL
# Library Management System CRUD API

This project is a simple Library Management System API that allows users to execute Create, Read, Update, and Delete (CRUD) operations on books and authors.

## What the project does:
The API enables managing a library's inventory of books and authors.

## How to run/setup the project:
1. Clone or download the repository.
2. Install dependencies using `npm install`.
3. Create a `.env` file and add your database connection string.
4. Run `npm start` to start the server.

### Import SQL
You can import the `database.sql` into your MySQL instance before starting the API.

## Screenshots/ERD:
[Link to ER Diagram](https://app.diagrams.net/?src=about#G1jXJ23CRPyvfLWv6pb9LyCm5k8c3JAmSc#%7B%22pageId%22%3A%221s8QPD7NvCNOdV-Pt0XG%22%7D)

**Source Code Files:**
- `app.js`: Main server file.
- `models/book.js`, `models/author.js`: Mongoose models for books and authors.
- `routes/books.js`, `routes/authors.js`: API routes for books and authors CRUD.
- `database.sql`: SQL script for creating the database.

**app.js (snippet) for database connection and server setup:**
```javascript
const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');

// Database connection
mongoose.connect(process.env.DB_URL, { useNewUrlParser: true, useUnifiedTopology: true });

const app = express();
app.use(cors());

require('./routes/books')(app, mongoose);
require('./routes/authors')(app, mongoose);

app.listen(process.env.PORT || 3000, () => {
  console.log('Server started on port', process.env.PORT || 3000);
});