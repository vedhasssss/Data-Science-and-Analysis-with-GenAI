# SQL

Everything I learn about SQL since joining the Data Science & Analytics with GenAI course. One file per lecture (or topic group), all written for **MySQL** with comments explaining each command. I keep adding to this as the course moves forward.

## Progress

| Status | Topic | File |
|--------|-------|------|
| ✅ | Basics: databases, tables, data types, INSERT, PRIMARY KEY, NULL, TRUNCATE/DROP | [`Basic1.sql`](Basic1.sql) |
| ✅ | SELECT, WHERE, UPDATE, DELETE, AND, COUNT | [`02_where_update_delete.sql`](02_where_update_delete.sql) |
| ✅ | LIMIT, ORDER BY, OFFSET, IS NULL, COALESCE, DISTINCT, GROUP BY, calculated columns | [`03_limit_orderby_null_distinct_groupby.sql`](03_limit_orderby_null_distinct_groupby.sql) |
| ✅ | Joins: INNER, LEFT, RIGHT, FULL (UNION) | [`04_joins.sql`](04_joins.sql) |
| ✅ | LIKE, string functions, math functions, date functions | [`05_like_string_math_date_functions.sql`](05_like_string_math_date_functions.sql) |
| ✅ | DATE_ADD/DATE_SUB, DATEDIFF, views, SUM/AVG/MIN/MAX | [`06_date_math_views_aggregates.sql`](06_date_math_views_aggregates.sql) |
| ⬜ | Window functions (RANK) | coming soon |
| ⬜ | Keys (primary, foreign) | coming soon |
| ⬜ | OR, IN, BETWEEN, HAVING | coming soon |

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
| `INNER JOIN` | only rows that match in both tables |
| `LEFT JOIN` | all rows from the left table, NULL where no match |
| `RIGHT JOIN` | all rows from the right table, NULL where no match |
| `LEFT JOIN ... UNION ... RIGHT JOIN` | full join (MySQL has no `FULL JOIN`) |
| `LIKE "R%"` / `"%h"` / `"%re%"` | starts with / ends with / contains |
| `UPPER()` / `LOWER()` / `LENGTH()` | change case / count characters |
| `SUBSTRING(text, start, len)` | take part of a string (position starts at 1) |
| `CONCAT(a, " ", b)` | join strings together |
| `REPLACE(text, old, new)` | swap part of a string |
| `ROUND()` / `CEIL()` / `FLOOR()` | round nearest / up / down |
| `CURRENT_DATE()` / `CURRENT_TIMESTAMP()` | today's date / date and time now |
| `YEAR()` / `MONTH()` / `DAY()` | pull a part out of a date |
| `DATE_ADD(date, INTERVAL 10 DAY)` | move a date forward (`DATE_SUB` for backward) |
| `DATEDIFF(date1, date2)` | days between two dates |
| `CREATE VIEW name AS SELECT ...` | save a query and use it like a table |
| `SUM()` / `AVG()` / `MIN()` / `MAX()` | total / average / lowest / highest |

## How to Run

1. Install MySQL (or use MySQL Workbench / XAMPP).
2. Run a file:
   ```bash
   mysql -u root -p < 06_date_math_views_aggregates.sql
   ```
   Or open it in MySQL Workbench and run it section by section.

Notes:
- `02_...sql` and `05_...sql` use the **classicmodels** sample database, which you need to import first.
- `03_...sql` creates its own `employees` table, but you'll need to insert some sample rows before the queries return anything. `05_...sql` and `06_...sql` reuse that `employees` table (in `db4`).
- `04_joins.sql` is fully self-contained: it creates the tables and inserts the sample data.
- `DROP`, `TRUNCATE`, and `DELETE` remove data permanently, so test them on practice databases only.

## Folder Structure

```
SQL/
├── README.md
├── Basic1.sql
├── 02_where_update_delete.sql
├── 03_limit_orderby_null_distinct_groupby.sql
├── 04_joins.sql
├── 05_like_string_math_date_functions.sql
├── 06_date_math_views_aggregates.sql
└── ...more as I learn
```

## Notes

- Sample data is dummy data.
- Files are meant to be read and run top to bottom.

— Vedhas Shinde
