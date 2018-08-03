# 1. Quiz
# Find the number f events that occur for each day or each channel

SELECT DATE_TRUNC('day', occurred_at) as day,
		channel,
        COUNT(*) as events_count
FROM web_events
GROUP BY day, channel
ORDER BY events_count DESC;


# 2. Quiz
# Create a subquery that provides all of the data rom your first query. 

SELECT *
FROM 
(SELECT DATE_TRUNC('day', occurred_at) as day,
		channel,
        COUNT(*) as events_count
FROM web_events
GROUP BY day, channel
ORDER BY events_count DESC) sub;


# 3. Quiz
# Find the average number of events or each channel.

SELECT channel,
	   AVG(events_count) as avg_events_count
FROM 
(SELECT DATE_TRUNC('day', occurred_at) as day,
		channel,
        COUNT(*) as events_count
FROM web_events
GROUP BY day, channel) sub
GROUP BY channel
ORDER BY avg_events_count DESC;

# More on subqueries:

# pull the first month/year combo from the orders table

SELECT DATE_TRUNC('month', MIN(occurred_at)) AS min_month
FROM web_events;

# pull the average for each. Total result

SELECT SUM(total_amt_usd)
FROM orders
WHERE DATE_TRUNC('month', occurred_at) = 
      (SELECT DATE_TRUNC('month', MIN(occurred_at)) FROM orders);

# Result per each kind of a peper

SELECT AVG(standard_qty) as avg_standard,
       AVG(gloss_qty) as avg_gloss,
       AVG(poster_qty) as avg_poster
FROM orders
WHERE DATE_TRUNC('month', occurred_at) =
(SELECT DATE_TRUNC('month', MIN(occurred_at)) AS min
FROM orders);