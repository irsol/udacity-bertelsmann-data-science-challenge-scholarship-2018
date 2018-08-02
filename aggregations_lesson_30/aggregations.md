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


## GROUP BY 

`GROUP BY` allows to take the sum of data limited to each account rather than across the enrire dataset.

+ **GROUP BY** can be used to aggregate data within subsets of the data. For example, grouping for different accounts, different regions, or different sales representatives.

+ The GROUP BY always goes between WHERE and ORDER BY

+ ORDER BY works like SORT in spreadsheet software

+ Any column in the SELECT statement that is not within an aggregator must be in the GROUP BY clause.

Example:

```
SELECT account_id,
	SUM(standard_qty) as standard_sum,
	SUM(gloss_qty) as gloss_sum,
	SUM(poster_qty) as poster_sum
FROM demo.orders
GROUP BY account_id
ORDER BY account_id;
```

##### GROUP BY - Expert Tip
it is worth noting that SQL evaluates the aggregations before the LIMIT clause. If you don’t group by any columns, you’ll get a 1-row result—no problem there. If you group by a column with enough unique values that it exceeds the LIMIT number, the aggregates will be calculated, and then some rows will simply be omitted from the results.

This is actually a nice way to do things because you know you’re going to get the correct aggregates. If SQL cuts the table down to 100 rows, then performed the aggregations, your results would be substantially different. The above query’s results exceed 100 rows, so it’s a perfect example.

You can GROUP BY multiple columns at once. This is often useful to aggregate across a number of different segments.

Example:
```
SELECT account_id,
	   channel,
	   COUNT(id) as events
FROM demo.web_events_full
GROUP BY account_id, channel
ORDER BY account_id, events DESC;
```
The order in the `ORDER BY` determines which column is ordered on first.
You can order `DESC` for any column in `ORDER BY`.

#####GROUP BY - Expert Tips
+ The order of column names in your `GROUP BY` clause doesn’t matter—the results will be the same regardless. If we run the same query and reverse the order in the GROUP BY clause, you can see we get the same results.


+ As with ORDER BY, you can substitute numbers for column names in the `GROUP BY` clause. It’s generally recommended to do this only when you’re grouping many columns, or if something else is causing the text in the GROUP BY clause to be excessively long.


+ A reminder here that any column that is not within an aggregation must show up in your GROUP BY statement. If you forget, you will likely get an error.


## DISTINCT

If you want to group by some columns but you don't want to include any aggregations you can use `DISTINCT`. 

`DISTINCT` is always used in SELECT statements, and it provides the unique rows for all columns written in the SELECT statement. Therefore, you only use DISTINCT once in any particular SELECT statement.

```
SELECT DISTINCT column1, DISTINCT column2, DISTINCT column3
FROM table1;
```

**DISTINCT - Expert Tip**
It’s worth noting that using `DISTINCT`, particularly in aggregations, can slow your queries down quite a bit.


## HAVING
**HAVING - Expert Tip**

`HAVING` is the “clean” way to filter a query that has been aggregated, but this is also commonly done using a subquery. Essentially, any time you want to perform a WHERE on an element of your query that was created by an aggregate, you need to use HAVING instead.

**WHERE** subsets the returned data based on a logical condition.
**WHERE** appears after the FROM, JOIN, ON clauses, but before GROUP BY.
**HAVING** appears after he GROUP BY clause but before the ORDER BY.
**HAVING** is leki **WHERE**, but it works on logical statement involving aggregations.

**Query clause order**
1. `SELECT`
2. `FROM`s
3. `WHERE`
4. `GROUP BY`
5. `HAVING`
6. `ORDER BY` 


## DATE Functions

GROUPing BY a date column is not usually very useful in SQL, as these columns tend to have transaction data down to a second.
There are a number of built in SQL functions that are aimed at helping us improve our experience in working with dates.

`DATE_TRUNC` allows you to truncate your date to a particular part of your date-time column. Common trunctions are day, month, and year. Here is a great blog post by Mode Analytics on the power of this function.

`DATE_PART` can be useful for pulling a specific portion of a date, but notice pulling month or day of the week (dow) means that you are no longer keeping the years in order. Rather you are grouping for certain components regardless of which year they belonged in.

You can reference the columns in your select statement in GROUP BY and ORDER BY clauses with numbers that follow the order they appear in the select statement. For example

```
SELECT standard_qty, COUNT(*)

FROM orders

GROUP BY 1 (this 1 refers to standard_qty since it is the first of the columns included in the select statement)

ORDER BY 1 (this 1 refers to standard_qty since it is the first of the columns included in the select statement)
```

`DATE_PART('dow')` pulls day of the week andr returns a value from 0 to 6 (0 is Sunday, 6 is Saturday).