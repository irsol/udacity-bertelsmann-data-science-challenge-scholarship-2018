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


# QUIZ: Subquery Mania
# 1. Provide the name of the sales_rep in each region with the largest amount of total_amt_usd sales.

SELECT s.name, s.region_id, MAX(o.total_amt_usd) as max_total
FROM sales_reps s
JOIN accounts a ON s.id = a.sales_rep_id
JOIN orders o ON a.id = o.account_id
GROUP BY s.name, s.region_id
ORDER BY max_total DESC;

# 2. For the region with the largest (sum) of sales total_amt_usd, how many total (count) orders were placed? 

SELECT s.name, r.name, SUM(o.total_amt_usd) as total_amt_usd, COUNT(total) total_orders
FROM region r
JOIN sales_reps s ON r.id = s.region_id
JOIN accounts a ON s.id = a.sales_rep_id
JOIN orders o ON a.id = o.account_id
GROUP BY s.name, r.name
ORDER BY total_amt_usd DESC;

# 3. For the name of the account that purchased the most (in total over their lifetime as a customer)
# standard_qty paper, how many accounts still had more in total purchases? 

