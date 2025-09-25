# SQL-Internhip-task2
Data Insertion and Handling Nulls


## 📌 Objective
Practice inserting, updating, and deleting data while handling NULL and DEFAULT values.

## 📂 Deliverables
- `task2.sql` → Contains all INSERT, UPDATE, DELETE statements.

## 🔍 Key Concepts Used
- **DML Commands** → INSERT, UPDATE, DELETE  
- **NULL Handling** → Used NULL for missing values  
- **DEFAULT Constraint** → Applied when value not provided  
- **WHERE Clause** → To update/delete specific rows  
- **ROLLBACK** → Undo deletion in a transaction  


## ✅ Interview Questions & Answers

1. **Difference between NULL and 0?**  
   - `NULL` = unknown / missing value.  
   - `0` = actual numeric value (zero).  

2. **What is a default constraint?**  
   - It assigns a value automatically when no value is provided. Example: `age INT DEFAULT 18`.

3. **How does IS NULL work?**  
   - Used to check missing values. Example: `SELECT * FROM Students WHERE email IS NULL;`.

4. **How do you update multiple rows?**  
   - By using `UPDATE ... WHERE`. Example:  
     ```sql
     UPDATE Books SET available_copies = 5 WHERE author = 'Navathe';
     ```

5. **Can we insert partial values?**  
   - Yes, if the remaining columns have `NULL` or `DEFAULT` values.  

6. **What happens if a NOT NULL field is left empty?**  
   - Error occurs, because NOT NULL requires a value.  

7. **How do you rollback a deletion?**  
   - Use transaction:  
     ```sql
     BEGIN;
     DELETE FROM Books WHERE book_id = 103;
     ROLLBACK;
     ```

8. **Can we insert values into specific columns only?**  
   - Yes, specify column names in `INSERT INTO`.  

9. **How to insert values using SELECT?**  
   - Example:  
     ```sql
     INSERT INTO Students (student_id, name, email, age)
     SELECT 4, name, email, age FROM Students WHERE student_id = 1;
     ```

10. **What is ON DELETE CASCADE?**  
    - If a parent record is deleted, all related child records are also deleted automatically.  


## 🚀 Outcome
- Database populated with clean and consistent data.  
- Learned to handle NULLs, defaults, and transactions.  
