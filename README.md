
# 📚 Library Database Management System using SQL

This project focuses on designing and implementing a robust **Library Management Database** using SQL. It demonstrates foundational and intermediate SQL skills including schema design, table creation, data insertion, and querying with constraints and relationships.

## 🗃 Dataset Overview

The dataset used in this project is named: `library_dataset_random.csv`.  
It contains bibliographic details such as Book Title, Author, Publisher, Category, ISBN, and Availability Count.

## 🏗 Project Structure

The SQL script (`TASK[(SQL)1].sql`) includes:

- 📁 **Database Creation**: `LibraryRaw`
- 📄 **Raw Table**: `RawLibrary` to store unnormalized data.
- 🧱 **Normalized Schema**:
  - `Authors`
  - `Publishers`
  - `Categories`
  - `Books`
- 🔁 Foreign key relationships for referential integrity.
- ✅ Sample insert queries and `SELECT` statements for validation.

## 📊 SQL Features Demonstrated

- `CREATE DATABASE` and `USE`
- `CREATE TABLE` with constraints (`PRIMARY KEY`, `UNIQUE`, `DEFAULT`, `FOREIGN KEY`)
- `INSERT INTO` with nested `SELECT`
- `SELECT *`, `LIMIT`, and database introspection
- Schema normalization from a raw CSV
