# Aggregation Questions
#
#
# 1.Find the total amount of poster_qty paper ordered in the orders table.

SELECT SUM(poster_qty) as total_poster_sales
FROM orders;

# 2.Find the total amount of standard_qty paper ordered in the orders table.

SELECT COUNT(standard_qty) as total_standard_sales
FROM orders;

# 3.Find the total dollar amount of sales using the total_amt_usd in the orders table.

SELECT COUNT(total_amt_usd) as total_dollar_sales
FROM orders;

# 4.Find the total amount spent on standard_amt_usd and gloss_amt_usd paper for each
# order in the orders table. This should give a dollar amount for each order in the table.

SELECT standard_amt_usd + gloss_amt_usd as total
FROM orders;

# 5. Find the standard_amt_usd per unit of standard_qty paper. Your solution should use
# both an aggregation and a mathematical operator.

SELECT SUM(standard_amt_usd)/SUM(standard_qty) as unit_price_standard_qty
FROM orders;


# MAX, MIN, AVG
#
#
# 1.When was the earliest order ever placed? You only need to return the date.

SELECT MIN(occurred_at) as earliest_order
FROM orders;

# 2.Try performing the same query as in question 1 without using an aggregation function. 

SELECT occurred_at as earliest_order
FROM orders
ORDER BY occurred_at ASC
LIMIT 1;

# 3.When did the most recent (latest) web_event occur?

SELECT MAX(occurred_at) as latest_web_event
FROM web_events;

# 4.Try to perform the result of the previous query without using an aggregation function.

SELECT occurred_at as latest_web_event
FROM web_events
ORDER BY occurred_at DESC
LIMIT 1;

# 5.Find the mean (AVERAGE) amount spent per order on each paper type, as well as the mean
# amount of each paper type purchased per order. Your final answer should have 6 values -
# one for each paper type for the average number of sales, as well as the average amount.

SELECT AVG(standard_qty) as avg_standard,
       AVG(gloss_qty) as avg_gloss,
       AVG(poster_qty) as avg_poster,
       AVG(standard_amt_usd) as avg_standart_usd,
       AVG(gloss_amt_usd) as avg_gloss_usd,
	 AVG(poster_amt_usd) as avg_poster_usd
FROM orders;

# 6.What is the MEDIAN total_usd
# spent on all orders?

/*
PERCENTILE_CONT interpolates the appropriate value, whether or not it exists in the data set,
while PERCENTILE_DISC always returns an actual value from the set.
*/

SELECT PERCENTILE_CONT(0.5)
WITHIN GROUP (ORDER BY total_amt_usd) as median_total_usd
FROM orders;


# Udycity solution:

/*Since there are 6912 orders - we want the average of the 3457 and 3456 order amounts when ordered.
This is the average of 2483.16 and 2482.55. This gives the median of 2482.855. This obviously isn't
an ideal way to compute. If we obtain new orders, we would have to change the limit. SQL didn't even
calculate the median for us. The above used a SUBQUERY, but you could use any method to find the two
necessary values, and then you just need the average of them.
*/

SELECT *
FROM (SELECT total_amt_usd
      FROM orders
      ORDER BY total_amt_usd
      LIMIT 3457) AS Table1
ORDER BY total_amt_usd DESC
LIMIT 2;



# GROUP BY

# 1.
# Which account (by name) placed the earliest order? Your solution should have the account name
# and the date of the order.

SELECT accounts.name as account_name, 
	 orders.occurred_at as order_date
FROM accounts
JOIN orders
ON accounts.id = orders.account_id
ORDER BY accounts.name
LIMIT 1;

# or

SELECT accounts.name as account_name, 
       MIN(orders.occurred_at) as order_date
FROM orders, accounts
GROUP BY accounts.name
ORDER BY accounts.name
LIMIT 1;

# 2.
# Find the total sales in usd for each account. You should include two columns - the total sales
# for each company's orders in usd and the company name.


SELECT accounts.name as account_name, 
	 SUM(orders.total_amt_usd) as total_sales_per_oder
FROM orders
JOIN accounts
ON accounts.id = orders.account_id
GROUP BY accounts.name;

# 3.
# Via what channel did the most recent (latest) web_event occur, which account was associated
# with this web_event? Your query should return only three values - the date, channel, and account name.

SELECT occurred_at as latest_web_events,
       accounts.name as account_name, 
       web_events.channel as channel_name
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
ORDER BY web_events.occurred_at DESC
LIMIT 1;

# 4.
# Find the total number of times each type of channel from the web_events was used. Your final
# table should have two columns - the channel and the number of times the channel was used.

SELECT COUNT(occurred_at) as use_web_events,  
       channel as channel_name
FROM web_events
GROUP BY web_events.channel;

# 5.Who was the primary contact associated with the earliest web_event? 

SELECT primary_poc 
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id 
ORDER BY web_events.occurred_at
LIMIT 1;

# 6.
# What was the smallest order placed by each account in terms of
# total usd. Provide only two columns - the account name and the total usd. Order from smallest
# dollar amounts to largest.

SELECT MIN(total_amt_usd) as smallest_order,
	 accounts.name as account_name
FROM accounts
JOIN orders
ON orders.account_id = accounts.id
GROUP BY accounts.name
ORDER BY smallest_order;

# 7.
# Find the number of sales reps in each region. Your final table should have two columns -
# the region and the number of sales_reps. Order from fewest reps to most reps.

SELECT region.name as region_name, 
COUNT(*) as number_sales_reps 	   
FROM region
JOIN sales_reps
ON sales_reps.region_id = region.id
GROUP BY region.name
ORDER BY number_sales_reps;


# GROUP BY Part 2
#

# 1.
# For each account, determine the average amount of each type of paper they purchased
# across their orders. Your result should have four columns - one for the account name and one
# for the average quantity purchased for each of the paper types for each account.

SELECT accounts.name as account_name,
       AVG(standard_qty) as avg_standard,
       AVG(gloss_qty) as avg_gloss,
       AVG(poster_qty) as avg_poster
FROM accounts
JOIN orders on accounts.id = orders.account_id
GROUP BY account_name;

# 2. 
# For each account, determine the average amount spent per order on each paper type.
# Your result should have four columns - one for the account name and one for the average
# amount spent on each paper type.

SELECT accounts.name as account_name,
       AVG(standard_amt_usd) as avg_standard,
       AVG(gloss_amt_usd) as avg_gloss,
       AVG(poster_amt_usd) as avg_poster
FROM accounts
JOIN orders on accounts.id = orders.account_id
GROUP BY account_name;


# 3.
# Determine the number of times a particular channel was used in the web_events table for each sales rep.
# Your final table should have three columns - the name of the sales rep, the channel, and the number of occurrences.
# Order your table with the highest number of occurrences first.
 
SELECT sales_reps.name as name, web_events.channel as channel, COUNT(channel) as num_events

FROM sales_reps
JOIN accounts on sales_reps.id = accounts.sales_rep_id
JOIN web_events on accounts.id = web_events.account_id
GROUP BY sales_reps.name, web_events.channel
ORDER BY num_events DESC;

# or

SELECT s.name, w.channel, COUNT(*) num_events
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.name, w.channel
ORDER BY num_events DESC;

# 4. 
# Determine the number of times a particular channel was used in the web_events table for each region. Your final
# table should have three columns - the region name, the channel, and the number of occurrences. Order your table
# with the highest number of occurrences first.

SELECT COUNT(web_events.channel) as num_occurences, region.name as name, web_events.channel as channel
FROM web_events 
JOIN accounts on web_events.account_id = accounts.id
JOIN sales_reps on accounts.sales_rep_id = sales_reps.id 
JOIN region on sales_reps.region_id = region.id
GROUP BY region.name, web_events.channel
ORDER BY num_occurences DESC;


# DISTINCT
#
# 1.Use DISTINCT to test if there are any accounts associated with more than one region.

SELECT DISTINCT id, name
FROM accounts;

# Solution with JOIN

SELECT a.name AS account_name,r.name AS region_name, COUNT(r.name)
FROM accounts a
JOIN sales_reps s
ON a.sales_rep_id=s.id
JOIN region r
ON s.region_id=r.id
GROUP BY a.name, r.name
Order by a.name;

# Solution with COUNT and DISTINCT to count unique and all data
SELECT COUNT(region.id) as all_records, COUNT(DISTINCT region_id) as unique_records
FROM sales_reps, region;

# Udacity solution
# If each account was associated with more than one region, the first query should
# have returned more rows than the second query.

SELECT a.id as "account id", r.id as "region id", 
a.name as "account name", r.name as "region name"
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON r.id = s.region_id;

#and 
SELECT DISTINCT id, name
FROM accounts;

# 2. Have many sales reps worked on more than one account?

SELECT DISTINCT id, name
FROM sales_reps;

# or

SELECT sales_reps.name, COUNT(*) num_accounts,
sales_reps.id 
FROM accounts 
JOIN sales_reps
ON sales_reps.id = accounts.sales_rep_id
GROUP BY sales_reps.id, sales_reps.name
ORDER BY num_accounts;


# HAVING
# 1.How many of the sales reps have more than 5 accounts that they manage?
#

SELECT s.id, s.name, COUNT(*) num_accounts
FROM sales_reps s
JOIN accounts a on s.id = a.sales_rep_id
GROUP BY s.id, s.name
HAVING COUNT(*) > 5
ORDER BY num_accounts;

# Using SUBQUERY

SELECT COUNT(*) num_reps_above5
FROM(SELECT s.id, s.name, COUNT(*) num_accounts
     FROM accounts a
     JOIN sales_reps s
     ON s.id = a.sales_rep_id
     GROUP BY s.id, s.name
     HAVING COUNT(*) > 5
     ORDER BY num_accounts) AS Table1;


# 2. How many accounts have more than 20 orders?
SELECT a.id, a.name, COUNT(*) num_orders
FROM accounts a
JOIN orders o 
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING COUNT(*) > 20 
ORDER BY num_orders;

# 3. Which account has the most orders?

SELECT a.id, a.name, COUNT(*) num_orders
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY num_orders DESC
LIMIT 1;

# 4. How many accounts spent more than 30,000 usd total across all orders?

SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(o.total_amt_usd) > 30000
ORDER BY total_spent;

# 5. How many accounts spent less than 1,000 usd total across all orders?

SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(o.total_amt_usd) < 1000
ORDER BY total_spent;

# 6. Which account has spent the most with us?

SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_spent DESC
LIMIT 1;

# 7. Which account has spent the least with us?

SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_spent
LIMIT 1;

# 8. Which accounts used facebook as a channel to contact customers more than 6 times?

SELECT a.id, a.name, w.channel, COUNT(*) count_channel
FROM accounts a
JOIN web_events w ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
HAVING COUNT(*) > 6
ORDER BY count_channel;

# 9. Which account used facebook most as a channel?

SELECT a.id, a.name, w.channel, COUNT(*) channel_use
FROM accounts a
JOIN web_events w ON a.id = w.account_id
WHERE  w.channel = 'facebook'
GROUP BY a.id, a.name, w.channel
ORDER BY channel_use DESC
LIMIT 1;


# 10. Which channel was most frequently used by most accounts?

SELECT a.id, a.name, w.channel, COUNT(*) channel_use
FROM accounts a
JOIN web_events w ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
ORDER BY channel_use DESC
LIMIT 10;