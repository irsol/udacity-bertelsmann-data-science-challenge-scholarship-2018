# Aggregations.

## NULLs

`NULL`s are a datatype that specifies where no data exists in SQL. Mean no data. It's different from a zero or space (space is a value).

NULLs are different than a zero (zero is a value) - they are cells where data does not exist. When identifying NULLs in a WHERE clause, we write IS NULL or IS NOT NULL. We don't use =, because NULL isn't considered a value in SQL. Rather, it is a property of the data.

## NULLs - Expert Tip
There are two common ways in which you are likely to encounter NULLs:

+ **NULL**s frequently occur when performing a LEFT or RIGHT JOIN. When some rows in the left table of a left join are not matched with rows in the right table, those rows will contain some NULL values in the result set.

+ **NULL**s can also occur from simply missing data in our database.

## NULLs and COUNT

`count()` function is returning of all the rows that contain some non-null data.

`count()` can also be used to count the number of non-null records in an individual column or any column in a table.

Notice that COUNT does not consider rows that have NULL values. Therefore, this can be useful for quickly identifying which rows have missing data.

## SUM

**SUM** works similarly to **COUNT** except you'll want to specify column names rather than using star.

Can't use  `SUM(*)` the way you canuse `COUNT(*)`. Unlike COUNT, you can only use SUM on numeric columns. However, SUM will ignore NULL values and treat NULLs as zero!

Aggregation Reminder
An important thing to remember: **aggregators only aggregate vertically - the values of a column**. If you want to perform a calculation across rows, you would do this with [simple arithmetic](https://community.modeanalytics.com/sql/tutorial/sql-operators/#arithmetic-in-sql).

## MIN and MAX

The syntax for MIN and MAx is similar to SUM and COUNT.  MIN and MAX ignore NULL values.

#####Expert Tip:
functionally, MIN and MAX are similar to COUNT in that they can be used on non-numerical columns. Depending on the column type, MIN will return the lowest number, earliest date, or non-numerical value as early in the alphabet as possible. As you might suspect, MAX does the opposite—it returns the highest number, the latest date, or the non-numerical value closest alphabetically to “Z.”


## AVG

`AVG` is a SQL aggregate function that calculates the average of a selected group of values. AVG has similar syntax to all of the other aggregation functions. AVG can be only used on numerical columns, it ignores nulls completely!! 

If you want to count NULLs as zero, you will need to use SUM and COUNT. However, this is probably not a good idea if the NULL values truly just represent unknown values for a cell.

#####MEDIAN - Expert Tip
One quick note that a median might be a more appropriate measure of center for this data, but finding the median happens to be a pretty difficult thing to get using SQL alone — so difficult that finding a median is occasionally asked as an interview question.

## MEDIAN

"Calculates a percentile based on a continuous distribution of the column value in SQL Server. The result is interpolated and might not be equal to any of the specific values in the column."

```
PERCENTILE_CONT ( numeric_literal )   
    
    WITHIN GROUP ( ORDER BY order_by_expression [ ASC | DESC ] )  
    
    OVER ( [ <partition_by_clause> ] )
```

[Median: PERCENTILE_CONT](https://docs.microsoft.com/en-us/sql/t-sql/functions/percentile-cont-transact-sql?view=sql-server-2017)