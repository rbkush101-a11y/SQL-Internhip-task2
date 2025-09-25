-- Task 2: Data Insertion and Handling Nulls

-- Insert Students
INSERT INTO Students (student_id, name, email, age)
VALUES (1, 'Alice', 'alice@example.com', 20),
       (2, 'Bob', NULL, 22),          -- NULL email
       (3, 'Charlie', 'charlie@mail.com', DEFAULT); -- default age

-- Insert Books
INSERT INTO Books (book_id, title, author, available_copies)
VALUES (101, 'Database Fundamentals', 'Navathe', 3),
       (102, 'Learning SQL', 'Alan Beaulieu', 2),
       (103, 'Clean Code', 'Robert C. Martin', NULL); -- NULL copies

-- Update multiple rows
UPDATE Books
SET available_copies = available_copies + 1
WHERE author = 'Navathe' OR author = 'Alan Beaulieu';

-- Delete a student
DELETE FROM Students
WHERE student_id = 3;

-- Insert using SELECT
INSERT INTO Students (student_id, name, email, age)
SELECT 4, name, email, age FROM Students WHERE student_id = 1;

-- Rollback example
BEGIN TRANSACTION;
DELETE FROM Books WHERE book_id = 103;
ROLLBACK;
