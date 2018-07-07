Primary and Foreign Keys
You learned a key element for JOINing tables in a database has to do with primary and foreign keys:

* primary keys - are unique for every row in a table. These are generally the first column in our database (like you saw with the id column for every table in the Parch & Posey database).

* foreign keys - are the primary key appearing in another table, which allows the rows to be non-unique.

Choosing the set up of data in our database is very important, but not usually the job of a data analyst. This process is known as Database Normalization.

JOINs
In this lesson, you learned how to combine data from multiple tables using JOINs. The three JOIN statements you are most likely to use are:

1. JOIN - an INNER JOIN that only pulls data that exists in both tables.
	
2. LEFT JOIN - a way to pull all of the rows from the table in the FROM even if they do not exist in the JOIN statement.
	
3. RIGHT JOIN - a way to pull all of the rows from the table in the JOIN even if they do not exist in the FROM statement.