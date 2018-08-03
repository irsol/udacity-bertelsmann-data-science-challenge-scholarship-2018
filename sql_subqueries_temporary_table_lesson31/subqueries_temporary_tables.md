## Intro to subqueries

Both **subqueries** and table expressions are methods for being able to write a query that creates a table, and then write a query that interacts with this newly created table. Sometimes the question you are trying to answer doesn't have an answer when working directly with existing tables in database.

However, if we were able to create new tables from the existing tables, we know we could query these new tables to answer our question

Whenever we need to use existing tables to create a new table that we then want to query again, this is an indication that we will need to use some sort of subquery.

**Subqueries** also known as **inner queries** and **nested queries** - allow you to answer more complex questions than you can with a single DB table. 