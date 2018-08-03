# 1. Quiz: CASE

/*
We would like to understand 3 different levels of customers based on the amount associated with their purchases.
The top branch includes anyone with a Lifetime Value (total sales of all orders) greater than 200,000 usd.
The second branch is between 200,000 and 100,000 usd. The lowest branch is anyone under 100,000 usd.
Provide a table that includes the level associated with each account. You should provide the account name, 
the total sales of all orders for the customer, and the level. Order with the top spending customers listed first.
*/

SELECT a.name,
	   SUM(o.total_amt_usd),
       CASE WHEN SUM(o.total_amt_usd) > 200000 THEN 'Over 200,000'
       		WHEN SUM(o.total_amt_usd) > 100000 THEN 'Over 100,000 '
       		ELSE 'Less 100,000' END as total_level
FROM orders o
JOIN accounts a on a.id = o.account_id
GROUP BY a.name
ORDER BY 2 DESC; 


# 2. Quiz: CASE

/* 
We would now like to perform a similar calculation to the first, but we want to obtain the total amount spent
by customers only in 2016 and 2017. Keep the same levels as in the previous question. Order with the top spending
customers listed first.
*/

SELECT DATE_TRUNC('year', o.occurred_at) as year,
	   a.name,
	   SUM(o.total_amt_usd),
       CASE WHEN SUM(o.total_amt_usd) > 200000 THEN 'Over 200,000'
       		WHEN SUM(o.total_amt_usd) > 100000 THEN 'Over 100,000 '
       		ELSE 'Less 100,000' END as total_level
FROM orders o
JOIN accounts a on a.id = o.account_id
WHERE o.occurred_at BETWEEN '2016-01-01' and '2017-12-31'
GROUP BY a.name, year
ORDER BY 3 DESC;

# 2. Udacity solution

SELECT a.name, SUM(total_amt_usd) total_spent, 
     CASE WHEN SUM(total_amt_usd) > 200000 THEN 'top'
     WHEN  SUM(total_amt_usd) > 100000 THEN 'middle'
     ELSE 'low' END AS customer_level
FROM orders o
JOIN accounts a
ON o.account_id = a.id
WHERE occurred_at > '2015-12-31' 
GROUP BY 1
ORDER BY 2 DESC;

# 3. Quiz: CASE

/*
We would like to identify top performing sales reps, which are sales reps associated with more than 200 orders.
Create a table with the sales rep name, the total number of orders, and a column with top or not depending on if
they have more than 200 orders. Place the top sales people first in your final table.
*/

SELECT s.name,
	   COUNT(*) as number_of_orders,
       CASE WHEN COUNT(*) > 200 THEN 'top'
       ELSE 'not' END as sales_level
FROM orders o
JOIN accounts a on o.account_id = a.id
JOIN sales_reps s on a.sales_rep_id = s.id
GROUP BY s.name
ORDER BY 2 DESC;

# 4. Quiz: CASE

/*
The previous didn't account for the middle, nor the dollar amount associated with the sales. Management
decides they want to see these characteristics represented as well. We would like to identify top performing
sales reps, which are sales reps associated with more than 200 orders or more than 750000 in total sales.
The middle group has any rep with more than 150 orders or 500000 in sales. Create a table with the sales rep name,
the total number of orders, total sales across all orders, and a column with top, middle, or low depending on this
criteria. Place the top sales people based on dollar amount of sales first in your final table.
*/

SELECT s.name,
	   COUNT(*) as number_of_orders,
       SUM(total_amt_usd) as total_usd,
       CASE WHEN COUNT(*) > 200 and SUM(total_amt_usd) > 750000 THEN 'top'
       		WHEN COUNT(*) > 150 and SUM(total_amt_usd) > 500000 THEN 'middle'
       	    ELSE 'not' END as sales_level
FROM orders o
JOIN accounts a on o.account_id = a.id
JOIN sales_reps s on a.sales_rep_id = s.id
GROUP BY s.name
ORDER BY sales_level DESC; 

# 4. Udacity Solution

SELECT s.name, COUNT(*), SUM(o.total_amt_usd) total_spent, 
     CASE WHEN COUNT(*) > 200 OR SUM(o.total_amt_usd) > 750000 THEN 'top'
     WHEN COUNT(*) > 150 OR SUM(o.total_amt_usd) > 500000 THEN 'middle'
     ELSE 'low' END AS sales_rep_level
FROM orders o
JOIN accounts a
ON o.account_id = a.id 
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.name
ORDER BY 3 DESC;