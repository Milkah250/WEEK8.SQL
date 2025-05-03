-- Creating Library Management System Database Schema

-- Create the library database
CREATE DATABASE LibraryManagement;
USE LibraryManagement;

-- Create the Books table
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    Genre VARCHAR(50),
    ISBN VARCHAR(13) UNIQUE,
    PublishedDate DATE,
    Quantity INT,
    FOREIGN KEY (Author) REFERENCES Authors(AuthorID)
);

-- Create the Authors table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    BirthDate DATE
);

-- Create the Borrowers table
CREATE TABLE Borrowers (
    BorrowerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100) UNIQUE NOT NULL
);

-- Create the BorrowingHistory table
CREATE TABLE BorrowingHistory (
    BorrowingID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    BorrowerID INT,
    ReturnDate DATE,
    DueDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID)
);

-- Sample data for demonstration
INSERT INTO Authors (FirstName, LastName, BirthDate) VALUES ('J.K.', 'Rowling', '1965-07-31');
INSERT INTO Books (Title, Author, Genre, ISBN, PublishedDate, Quantity) VALUES ('Harry Potter and the Philosopher\'s Stone', 1, 'Fantasy', '978-0747546255', '1997-06-26', 50);
