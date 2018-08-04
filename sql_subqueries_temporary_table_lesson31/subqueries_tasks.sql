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

SELECT a.name, w.channel, COUNT(w.id)
FROM accounts a
JOIN web_events w ON a.id = w.account_id
GROUP BY 1, 2
HAVING a.name = (SELECT customer 
FROM (SELECT a.name AS customer, SUM(o.total_amt_usd) AS total_usd
FROM accounts a
JOIN orders o ON a.id = o.account_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1) t1)
ORDER BY 3 DESC;

# 4. For the customer that spent the most (in total over their lifetime as
# a customer) total_amt_usd, how many web_events did they have for each channel?

SELECT * 
FROM (SELECT a.name, w.channel, COUNT(w.channel)
    FROM web_events w
      JOIN accounts a ON a.id = w.account_id
      GROUP BY a.name, w.channel) t1
JOIN (SELECT a.name, sum(o.total_amt_usd) total_usd
    FROM accounts a
      JOIN orders o ON a.id = o.account_id
      GROUP BY a.name
      ORDER BY total_usd DESC
      LIMIT 1) t2
      ON t1.name = t2.name


# 5. What is the lifetime average amount spent in terms
# of total_amt_usd for the top 10 total spending accounts?

SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY 3 DESC
LIMIT 10;

# average of 10 amounts

SELECT AVG(total_spent)
FROM (SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
      FROM orders o
      JOIN accounts a
      ON a.id = o.account_id
      GROUP BY a.id, a.name
      ORDER BY 3 DESC
       LIMIT 10) temp;

# 6. What is the lifetime average amount spent in terms
# of total_amt_usd for only the companies that spent more
# than the average of all orders.

SELECT AVG(avg_amt_usd)
FROM (SELECT o.account_id, AVG(o.total_amt_usd) as avg_amt_usd
FROM orders o
GROUP BY 1
HAVING AVG(o.total_amt_usd) > 
(SELECT AVG(total_amt_usd)
FROM orders)) temp_table;
