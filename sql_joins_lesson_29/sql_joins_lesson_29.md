## Relational DB

The term **relational database** refers to the fact that tables within it relate to one another. They contain common identidiers that allow information from 
multiple tables to be easily combined.

When you write a query it's execution speed depends on the amount of data you're asking the db to read and the number and type of calculation you're
asking it to make.

## DB normailization.

When creating a db, it's really important to think about how data will be stored. This is known as **normalization**.
There are essentially three ideas that are aimed at database normalization:

1. Are the tables storing logical groupings of the data?
2. Can I make changes in a single location, rather than in many tables for the same information?
3. Can I access and manipulate data quickly and efficiently?

[Why You Need Database Normalization link](http://www.itprotoday.com/microsoft-sql-server/sql-design-why-you-need-database-normalization)

Example:
Here we are only pulling data from the orders table since in the SELECT statement we only reference columns from the orders table.
The ON statement holds the two columns that get linked across the two tables.

![inner join](join_sql.png)

To specify tables and columns in the SELECT statement:

1. The table name is always before the period.
2. The column you want from that table is always after the period.

For example, if we want to pull only the account name:

```
SELECT accounts.name, orders.occurred_at
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;
```
This query only pulls two columns, not all the information in these two tables.