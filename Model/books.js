const mongoose = require('mongoose');

const BookSchema = new mongoose.Schema({
  title: String,
  author: ObjectId, // Reference to Author model
  genre: String,
  ISBN: String,
  publishedDate: Date,
  quantity: Number
});

module.exports = mongoose.model('Book', BookSchema);

// Similarly, define the Author model.