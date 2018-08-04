## Intro to subqueries

Both **subqueries** and table expressions are methods for being able to write a query that creates a table, and then write a query that interacts with this newly created table. Sometimes the question you are trying to answer doesn't have an answer when working directly with existing tables in database.

However, if we were able to create new tables from the existing tables, we know we could query these new tables to answer our question

Whenever we need to use existing tables to create a new table that we then want to query again, this is an indication that we will need to use some sort of subquery.

**Subqueries** also known as **inner queries** and **nested queries** - allow you to answer more complex questions than you can with a single DB table. 

## Write your first subquery
We want to find the average number of events for each day for each channel. The first table will provide us the number of events for each day and channel, and then we will need to average these values together using a second query.

1. Start by querying table to check the data.

```
SELECT *
FROM web_events;
``` 

2. Count up all the events in each channel, in each day.

```
SELECT DATE_TRUNC('day', occurred_at) as day,
	   channel,
       COUNT(*) as event_count
FROM web_events
GROUP BY 1, 2
ORDER BY 1;
```

3. Average across the events column we've created. In order to do this, we quering the result of previous query. We can do it by wrapping the query in parantheses and using it in the FROM clause of the next query that you write above.

Query within a query also known as a subquery:
```
SELECT *
FROM 
(SELECT DATE_TRUNC('day', occurred_at) as day,
	   channel,
       COUNT(*) as event_count
FROM web_events
GROUP BY 1, 2
ORDER BY 1) sub
```
**Subqueries** are requaired to have aliases, which added after the parantheses `()sub`.

4. Average events for each channel. Subquery acts like one table in the FORM clause put GROUP BY clause after he subquery. 
Since reordering based on this new aggregation, you don't need ORDER BY statement in the subquery.
```
SELECT channel,
	   AVG(event_count) AS avg_event_count
FROM 
(SELECT DATE_TRUNC('day', occurred_at) as day,
	   channel,
       COUNT(*) as event_count
FROM web_events
GROUP BY 1, 2) sub
	GROUP BY channel
    ORDER BY 2 DESC;
```

####How this query runs: 

1. Inner query will run. DB will treat it as an independent query
```
SELECT DATE_TRUNC('day', occurred_at) as day,
	   channel,
       COUNT(*) as event_count
FROM web_events
GROUP BY 1, 2
```
2. The outer query will run accross he result set created by he inner query:
```
SELECT channel,
	   AVG(event_count) AS avg_event_count
FROM 
(SELECT DATE_TRUNC('day', occurred_at) as day,
	   channel,
       COUNT(*) as event_count
FROM web_events
GROUP BY 1, 2) sub
	GROUP BY channel
    ORDER BY 2 DESC;
```

## Subquery Formatting

#### Badly formatted queries

```
SELECT * FROM (SELECT DATE_TRUNC('day',occurred_at) AS day, channel, COUNT(*) as events FROM web_events GROUP BY 1,2 ORDER BY 3 DESC) sub;
```

This second version, which includes some helpful line breaks, is easier to read than that previous version, but it is still not as easy to read as the queries in the Well Formatted Query section.

```
SELECT *
FROM (
SELECT DATE_TRUNC('day',occurred_at) AS day,
channel, COUNT(*) as events
FROM web_events 
GROUP BY 1,2
ORDER BY 3 DESC) sub;
```

#### Well Formatted Query

If we have a GROUP BY, ORDER BY, WHERE, HAVING, or any other statement following our subquery, we would then indent it at the same level as our outer query.

```
SELECT *
FROM (SELECT DATE_TRUNC('day',occurred_at) AS day,
                channel, COUNT(*) as events
      FROM web_events 
      GROUP BY 1,2
      ORDER BY 3 DESC) sub;
```

The inner query GROUP BY and ORDER BY statements are indented to match the inner table. 
```
SELECT *
FROM (SELECT DATE_TRUNC('day',occurred_at) AS day,
                channel, COUNT(*) as events
      FROM web_events 
      GROUP BY 1,2
      ORDER BY 3 DESC) sub
GROUP BY channel
ORDER BY 2 DESC;
```

## More on Subqueries

If you are only returning a single value, you might use that value in a logical statement like WHERE, HAVING, or even SELECT - the value could be nested within a CASE statement. Most conditional logic will work with subqueries containing **one-cell results**. BUT `IN` is the only type of conditional logic that will work when the inner query ontains multiple results. 



**Expert Tip**

Note that you should not include an alias when you write a subquery in a conditional statement. This is because the subquery is treated as an individual value (or set of values in the IN case) rather than as a table.

Also, notice the query here compared a single value. If we returned an entire column IN would need to be used to perform a logical argument. If we are returning an entire table, then we must use an ALIAS for the table, and perform additional logic on the entire table.

### MORE on sub queries

1. Subquery table
```
SELECT a.id, a.name, we.channel, COUNT(*) as ct
FROM accounts a
JOIN web_events we 
ON a.id = we.account_id
GROUP BY a.id, a.name, channel
ORDER BY a.id;
```

2. Find the max from all data:
```
SELECT MAX(ct)

FROM (SELECT a.id, a.name, we.channel, COUNT(*) as ct
	FROM accounts a
	JOIN web_events we 
	ON a.id = we.account_id
	GROUP BY a.id, a.name, channel
	ORDER BY a.id) table1
```

3. Max for every accounts:

```
SELECT t1.id, t1.name, MAX(ct)
FROM (SELECT a.id, a.name, we.channel, COUNT(*) as ct
	FROM accounts a
	JOIN web_events we 
	ON a.id = we.account_id
	GROUP BY a.id, a.name, channel) t1
GROUP BY t1.id, t1.name
ORDER BY t1.id;
```

4. Final table:

```
SELECT t3.id, t3.name, t3.channel, t3.ct
FROM (SELECT a.id, a.name, we.channel, COUNT(*) as ct
	FROM accounts a
	JOIN web_events we 
	ON a.id = we.account_id
	GROUP BY a.id, a.name, channel) t3

JOIN (SELECT t1.id, t1.name, MAX(ct) max_chan
FROM (SELECT a.id, a.name, we.channel, COUNT(*) as ct
	FROM accounts a
	JOIN web_events we 
	ON a.id = we.account_id
	GROUP BY a.id, a.name, channel) t1
GROUP BY t1.id, t1.name) t2
ON t2.id = t3.id AND t2.max_chan = t3.ct
ORDER BY t3.id, t3.ct;
```

## WITH 

The `WITH` statement is often called a Common Table Expression or CTE. Though these expressions serve the exact same purpose as subqueries, they are more common in practice, as they tend to be cleaner for a future reader to follow the logic.

Subqueries they make queries lengthy and difficult to read. Common Table Expressions or CTEs can help break your query into separate components and the logic will be more easily to read.

* When creating multiple ables using `WITH` add a comma after every table except the last table leading to final query.
* The new table name  always aliased using `table_name AS`, which is followed by your nasted between parentheses.