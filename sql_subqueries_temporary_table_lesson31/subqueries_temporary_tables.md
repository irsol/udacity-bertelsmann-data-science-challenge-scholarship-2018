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