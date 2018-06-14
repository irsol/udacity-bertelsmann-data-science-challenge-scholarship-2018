## Types of Statements.

The SQL laguage has a few different elements, the most basic of which is a statements. `Statements` tell the db what you'd like to do with the data. 

`CREATE TABLE` is a statement that creates a new table in a db, changes the data in a db.

`DROP TABLE` removes a table in a db, changes the data in a db.

`SELECT` allows to read data and displays it. Select statements are commonly referred as **queries**. 

## SELECT and FROM.

In order to generate the list of all orders, write a SELECT statement. 

`SELECT` is where you tell the query what columns you want back. Column names are separated by commas with no comma after the last column name. 

`SELECT *` select with asterik means select all.

`FROM` is where you tell the query what table you are querying from. Notice the columns need to exist in this table.

Both SELECT and FROM clauses are mandatory.

## Formatting.

It is common practice to capitalize commands (SELECT, FROM). This makes queries easier to read, which will matter more as you write more complex queries.

It is common to use underscores and avoid spaces in column names. It is a bit annoying to work with spaces in SQL.

SQL is not case sensitive. But it's a good habits to capitalize commands. 

Depending on your SQL environment, your query may need a semicolon at the end to execute. Other environments are more flexible in terms of this being a "requirement." 

Best practice:

```
SELECT column

FROM table;
```