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

