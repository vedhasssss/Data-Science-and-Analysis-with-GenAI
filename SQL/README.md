# SQL

Everything I learn about SQL since joining the Data Science & Analytics with GenAI course. One file per lecture (or topic group), all written for **MySQL** with comments explaining each command. I keep adding to this as the course moves forward.

## Progress

| Status | Topic | File |
|--------|-------|------|
| ✅ | Basics: databases, tables, data types, INSERT, PRIMARY KEY, NULL, TRUNCATE/DROP | [`Basic1.sql`](Basic1.sql) |
| ✅ | SELECT, WHERE, UPDATE, DELETE, AND, COUNT | [`02_where_update_delete.sql`](02_where_update_delete.sql) |
| ✅ | LIMIT, ORDER BY, OFFSET, IS NULL, COALESCE, DISTINCT, GROUP BY, calculated columns | [`03_limit_orderby_null_distinct_groupby.sql`](03_limit_orderby_null_distinct_groupby.sql) |
| ⬜ | OR, IN, BETWEEN, LIKE | coming soon |
| ⬜ | Aggregate functions (SUM, AVG, MIN, MAX) and HAVING | coming soon |
| ⬜ | Joins | coming soon |

## Cheat Sheet

| Command | What it does |
|---------|--------------|
| `SELECT ... FROM ... WHERE` | read rows that match a condition |
| `UPDATE ... SET ... WHERE` | change existing rows |
| `DELETE FROM ... WHERE` | remove specific rows |
| `TRUNCATE TABLE` | remove all rows, keep the table |
| `DROP TABLE` / `DROP DATABASE` | remove the table / database entirely |
| `ORDER BY col DESC` | sort results |
| `LIMIT n OFFSET m` | take n rows after skipping m |
| `IS NULL` / `IS NOT NULL` | find missing / present values |
| `COALESCE(col, 0)` | replace NULL with a default |
| `DISTINCT` | unique values only |
| `GROUP BY` | group rows to count/aggregate per group |

## How to Run

1. Install MySQL (or use MySQL Workbench / XAMPP).
2. Run a file:
   ```bash
   mysql -u root -p < 03_limit_orderby_null_distinct_groupby.sql
   ```
   Or open it in MySQL Workbench and run it section by section.

Notes:
- `02_where_update_delete.sql` uses the **classicmodels** sample database, which you need to import first.
- `03_...sql` creates its own `employees` table, but you'll need to insert some sample rows before the queries return anything.
- `DROP`, `TRUNCATE`, and `DELETE` remove data permanently, so test them on practice databases only.

## Folder Structure

```
SQL/
├── README.md
├── Basic1.sql
├── 02_where_update_delete.sql
├── 03_limit_orderby_null_distinct_groupby.sql
└── ...more as I learn
```

## Notes

- Sample data is dummy data.
- Files are meant to be read and run top to bottom.

— Vedhas Shinde
