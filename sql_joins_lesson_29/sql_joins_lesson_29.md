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

## ERD reminder.

ERD or entity relationship diagram is a common way to view data in a database. 

![ERD diagram](entity_relationship_diagram.png)
The PK here stands for primary key. A primary key exists in every table, and it is a column that has a unique value for every row.
If you look at the first few rows of any of the tables in our database, you will notice that this first, PK, column is always unique. For this database it is always called id, but that is not true of all databases.

## Primary and Foreign Keys.

`Primary Key (PK)`
A primary key is a unique column in a particular table. This is the first column in each of **our tables**. Here, those columns are all called id, but that doesn't necessarily have to be the name. It is common that the primary key is the first column in our tables in most databases.

The primary key is a single column that must exist in each table of a database. Again, these rules are true for most major databases, but some databases may not enforce these rules.

`Foreign Key (FK)`
A foreign key is when we see a primary key in another table. 

Foreign keys are always associated with a primary key, and they are associated with the crow-foot notation above to show they can appear multiple times in a particular table.

![primary and foreign key](primary_foreign_key.png)

## JOIN more than two tables.

```
SELECT *
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
JOIN orders
ON accounts.id = orders.account_id;
```

## ALIAS

When we `JOIN` tables together it's easiest to give your table names **aliases**. The `ALIAS` for a table will be created in the `FROM` or `JOIN` clauses.
Best practice: to use all lower case letters and underscores instead of spaces.
Example:
```
FROM tablename AS t1
JOIN tablename2 AS t2
```
Or without the AS statement:
```
FROM tablename t1
JOIN tablename2 t2
```

We can simply write our alias directly after the column name (in the SELECT) or table name (in the FROM or JOIN) by writing the alias directly following the column or table we would like to alias. 
```
SELECT col1 + col2 total, col3
```

```
Select t1.column1 aliasname, t2.column2 aliasname2
FROM tablename AS t1
JOIN tablename2 AS t2
```

## Many-to-many relationships 

[Why no many-to-many relationships?](https://stackoverflow.com/questions/7339143/why-no-many-to-many-relationships)

## LEFT and RIGHT JOIN

INNER JOIN will return only rows that appear in **both tables**.

This Inner Join will return only rows at the intersection of these two circles.
If want to show accounts that don't appear in the orders table we need to use OUTER Join.
``` 
SELECT accounts.id, accounts.name, order.total
FROM orders 
JOIN accounts
ON orders.account_id = accounts.id
```

Venn Diagram is a common way to visualize JOINs. Each circle in the diagram represents a table. The left circle includes all rows of data in the table in  **FROM** clause. The right circle represents all raws of data in the table in **JOIN** clause. The overlapping middle section represents all rows for which the ON clause is **true**.
![Venn Diagram](venn_diagram.png)

There are three types of joins we might use if we want to include data that doesn't exist in both tables (only in one of the two tables): LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN. 

LEFT JOIN produces a complete set of records from the left table regardless if any of those records have match in the right table. It will also return any results that are in the left table that didn't match.

RIGHT JOIN will return all of the records in the right table regardless if any of those records have a match in the left table. 
Left and Right joins are somewhat interchangeable:
![left and right](interchangeable_result.png)

If there is not matching information in the JOINed table, then you will have columns with empty cells. These empty cells introduce a new data type called NULL.

## OUTER JOIN

OUTER JOIN will return the inner join result set, as well as any unmatched rows from either of the two tables being joined.

Again this returns rows that do not match one another from the two tables. The use cases for a full outer join are very rare. 
[When is a good situation to use a full outer join?](https://stackoverflow.com/questions/2094793/when-is-a-good-situation-to-use-a-full-outer-join)

FULL OUTER JOIN, which is the same as OUTER JOIN. LEFT OUTER JOIN and RIGHT OUTER JOIN the same as LEFT JOIN and RIGHT JOIN.

## JOINs and Filtering 

`ON` logic in the on clause reduces the rows **before combining the tables**.

`WHERE` logic in the where clause occurs **after the join occurs**.

 When the database executes the query, it executes the join and everything in the **ON clause first**. Think of this as building the new result set. That result set is then filtered using the WHERE clause.

 INNER JOINs only return the rows for which the two tables match, moving this filter to the ON clause of an inner join will produce the same result as keeping it in the WHERE clause.