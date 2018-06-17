## Types of Statements.

The SQL laguage has a few different elements, the most basic of which is a statements. `Statements` tell the db what you'd like to do with the data. 

`CREATE TABLE` is a statement that creates a new table in a db, changes the data in a db.

`DROP TABLE` removes a table in a db, changes the data in a db.

`SELECT` allows to read data and displays it. Select statements are commonly referred as **queries**. 

## SELECT and FROM

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

## LIMIT

LIMIT statement is used to retrieve records from one or more tables in a database and limit the number of records returned based on a limit value. 

```
SELECT *
FROM table
LIMIT 10;
```

## ORDER BY

ORDER BY statement allows to order table by any row. It goes between the FROM and LIMIT clauses. By default ORDER BY goes from `a to z`, lowest to highest or earliest to latest if working with dates. This is referred to as ascending order.

To sort in descending order, add DESC (from biggest to lowest) after the column in ORDER BY statement.

## WHERE

WHERE statement allows to filter a set of results based on specific criteria. WHERE claus goes after FROM but before ORDER BY or LIMIT.

Comparison operators:
```
> (greater than)

< (less than)

>= (greater than or equal to)

<= (less than or equal to)

= (equal to)

!= (not equal to)
```

## WHERE with Non-Numerical Data.

Comparison operators can work with non-numerical data as well. If you're using an operator with values that are non-numerical you'll need to put the value in single quotes.

## Arithmetic Operators

**Derived Column** a new column that is a manipulation of the existing columns in your db.
Can include simple arithmetic or any number of advanced conculations. 
```
* (Multiplication)

+ (Addition)

- (Subtraction)

/ (Division)
```

To rename a derived column: add AS to the end of the line that produced the derived column
and give  then it a name:

```
glossy_qty + poster_qty AS nonstandard_qty
```

## Logical Operators

1. LIKE
This allows you to perform operations similar to using WHERE and =, but for cases when you might not know exactly what you are looking for.

2. IN
This allows you to perform operations similar to using WHERE and =, but for more than one condition.

3. NOT
This is used with IN and LIKE to select all of the rows NOT LIKE or NOT IN a certain condition.

4. AND & BETWEEN
These allow you to combine operations where all combined conditions must be true.

5. OR
This allow you to combine operations where at least one of the combined conditions must be true.

## LIKE

The `LIKE` operator is exremely useful working with text. Use LIKE within a WHERE clause.
The LIKE operator is frequently used with '%Example%' or 'S%' or '%s'.

## IN

The `IN` operator is useful for working with both numeric and text columns. This operators allows you to use `=` but for more than one item
of that particular column and all within the same query.

`IN` requaries single quotation marks around **non-numerical data**, **numerical data** can be entered directly.

## NOT

The `NOT` operator useful for working with the `IN` and `LIKE` operators. By specifying `NOT IN` and `NOT LIKE` we can grab all of the rows
that don't meet a particular criteria.

`NOT` provides the inverse results for IN, LIKE and similar operators.

## AND and BETWEEN
The `AND` operator is used within a WHERE statement to consider more than one logical clause at a time. Each time you link a new statement with an AND, you will need to specify the column you are interested in looking at. You may link as many statements as you would like to consider at the same time. This operator works with all of the operations we have seen so far including arithmetic operators (+, *, -, /). LIKE, IN, and NOT logic can also be linked together using the AND operator.
 The `BETWEEN` operator:
```
WHERE column BETWEEN 6 AND 10
```
The same as:
```
WHERE column >= 6 AND column <= 10
```


## OR

`OR` is a logical operator in SQL that allows to select rows that satisfy either of two conditions. It works similary to `AND` which select the rows that satisfy both of 2 conditions. `OR` works with all the operations including arithmetic operators (+, -, *, /). When combining multiple of these operations, might need to use **parentheses** to assure that the logic you want to perform is being executed correctly.