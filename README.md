# SQL-Internhip-task2
Data Insertion and Handling Nulls

# Library Management SQL - Task 2

## 📌 Overview
This project is a **Library Management System** with:
- `Books` table
- `Members` table
- `Borrowings` table (relation with ON DELETE CASCADE)

## 🚀 Features
- Insert, Update, Delete operations
- Handling NULLs and default values
- Rollback transactions
- Insert using SELECT
- Foreign key with ON DELETE CASCADE

## 📂 Files
- `task2.sql` → All SQL queries
- `README.md` → Documentation

## 🛠 Tools Used
- SQLite (via VS Code)


✅ Interview Questions & Answers

1. Difference between NULL and 0?
- NULL = absence of value (unknown, missing).
- 0 = an actual numeric value.
    👉 Example: Age = NULL means we don’t know, Age = 0 means the person is a newborn.

2. What is a default constraint?
- A rule that assigns a default value if no value is given.
    👉 Example: course TEXT DEFAULT 'Not Assigned'
    If you don’t insert a course, it becomes "Not Assigned".

3. How does IS NULL work?
- Used to check if a column value is NULL.
    👉 Example: SELECT * FROM Books WHERE available_copies IS NULL;

4. How do you update multiple rows?
- By using a WHERE condition that matches more than one row.
    👉 Example: UPDATE Books SET available_copies = 1 WHERE available_copies IS NULL;

5. Can we insert partial values?
- ✅ Yes, if columns have default values or allow NULL.
    👉 Example: INSERT INTO Books (title) VALUES ('SQL Basics');

6. What happens if a NOT NULL field is left empty?
- ❌ Error will occur because the column requires a value.

7. How do you rollback a deletion?
- Use transactions: 
    BEGIN TRANSACTION;
    DELETE FROM Books WHERE book_id = 1;
    ROLLBACK;  -- Undo the delete

8. Can we insert values into specific columns only?
- ✅ Yes, just mention the column names.
    👉 Example: INSERT INTO Books (title, author) VALUES ('Python 101', 'Soumya');

9. How to insert values using SELECT?
- Copy values from another table/row.
    👉 Example: INSERT INTO Books (title, author, published_year)



Code


-- Task 2: Data Insertion and Handling Nulls
-- Library Management System Example

PRAGMA foreign_keys = ON;

-- 1. Create tables
CREATE TABLE Books (
    book_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    author TEXT,
    published_year INTEGER,
    available_copies INTEGER DEFAULT 1
)

CREATE TABLE Members (
    member_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT UNIQUE,
    join_date DATE DEFAULT (DATE('now'))
);

CREATE TABLE Borrowings (
    borrow_id INTEGER PRIMARY KEY AUTOINCREMENT,
    book_id INTEGER,
    member_id INTEGER,
    borrow_date DATE DEFAULT (DATE('now')),
    return_date DATE,
    FOREIGN KEY(book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
    FOREIGN KEY(member_id) REFERENCES Members(member_id) ON DELETE CASCADE
);

-- 2. INSERT (full, partial, NULL, default)
INSERT INTO Books (title, author, published_year, available_copies)
VALUES ('SQL Basics', 'Ravi Kumar', 2020, 5);

INSERT INTO Books (title, author, published_year)
VALUES ('Data Structures', 'Deepa Sharma', 2019); -- default copies = 1

INSERT INTO Books (title, author, published_year, available_copies)
VALUES ('Python for Beginners', 'Soumya Jain', 2021, NULL);

INSERT INTO Books (title) VALUES ('Java Advanced'); -- partial insert

INSERT INTO Members (name, email)
VALUES ('Rishabh', 'rishabh@example.com');

INSERT INTO Members (name, email)
VALUES ('Rolly', 'rolly@example.com');

-- 3. UPDATE (single + multiple)
UPDATE Books SET available_copies = 10 WHERE book_id = 1;

UPDATE Books SET available_copies = 1 WHERE available_copies IS NULL;

-- 4. DELETE + rollback example
BEGIN TRANSACTION;
DELETE FROM Books WHERE book_id = 4; -- delete Java Advanced
ROLLBACK; -- undo deletion

-- 5. INSERT using SELECT
INSERT INTO Books (title, author, published_year, available_copies)
SELECT title || ' Copy', author, published_year, available_copies
FROM Books WHERE book_id = 1;

-- 6. Borrowings demo (ON DELETE CASCADE)
INSERT INTO Borrowings (book_id, member_id, return_date)
VALUES (1, 1, '2025-10-01');

-- If book_id=1 is deleted, related borrowings also get deleted
-- DELETE FROM Books WHERE book_id = 1;

                SELECT title, author, published_year FROM Books WHERE book_id = 1;

10. What is ON DELETE CASCADE?
- A foreign key option that automatically deletes child rows when the parent is deleted.
    👉 Example: If you delete a book, all its borrowings will be deleted too. 
    
