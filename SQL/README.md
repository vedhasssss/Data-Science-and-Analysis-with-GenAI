# SQL

This folder is where I'll keep everything I learn about SQL since joining the Data Science & Analytics with GenAI course. It's a work in progress: I'll keep adding new files and updating existing ones as the course moves forward.

All code is written for **MySQL**, with comments explaining each command.

## Progress

| Status | Topic | File |
|--------|-------|------|
| ✅ | Basics: databases, tables, data types, INSERT, PRIMARY KEY, NULL, TRUNCATE/DROP |['Basic1.sql](https://github.com/vedhasssss/Data-Science-and-Analysis-with-GenAI/blob/main/SQL/Basic1.sql)|
| ⬜ | SELECT with WHERE, ORDER BY, LIMIT | coming soon |
| ⬜ | UPDATE and DELETE | coming soon |
| ⬜ | Aggregate functions and GROUP BY | coming soon |
| ⬜ | Joins | coming soon |

I'll tick things off and add new rows as I go.

## How to Run

1. Install MySQL (or use MySQL Workbench / XAMPP).
2. Run any file:
   ```bash
   mysql -u root -p < basics_of_sql.sql
   ```
   Or open it in MySQL Workbench and run it section by section.

> `DROP` and `TRUNCATE` delete data permanently, so they're commented out in the files. Uncomment them only when you want to try them.

## Folder Structure

```
sql/
├── README.md
├── basics_of_sql.sql
└── ...more files as I learn
```

## Notes

- Sample data in the files is dummy data.
- Files are written to be run top to bottom.

— Vedhas Shinde
