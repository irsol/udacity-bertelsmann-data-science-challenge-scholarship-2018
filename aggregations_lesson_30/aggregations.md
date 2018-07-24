# Aggregations.

## NULLs

`NULL`s are a datatype that specifies where no data exists in SQL. Mean no data. It's different from a zero or space (space is a value).

NULLs are different than a zero (zero is a value) - they are cells where data does not exist. When identifying NULLs in a WHERE clause, we write IS NULL or IS NOT NULL. We don't use =, because NULL isn't considered a value in SQL. Rather, it is a property of the data.

## NULLs - Expert Tip
There are two common ways in which you are likely to encounter NULLs:

+ **NULL**s frequently occur when performing a LEFT or RIGHT JOIN. When some rows in the left table of a left join are not matched with rows in the right table, those rows will contain some NULL values in the result set.

+ **NULL**s can also occur from simply missing data in our database.