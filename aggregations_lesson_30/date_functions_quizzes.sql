# 1. Find the sales in terms of total dollars for all orders in each year.

SELECT DATE_TRUNC('year', occurred_at) as year,
	   SUM(total) as total
FROM orders
GROUP BY 1
ORDER BY 2 DESC;

# 2. Which month did Parch & Posey have the greatest sales in terms of
# total dollars? Are all months evenly represented by the dataset?

SELECT DATE_TRUNC('month', occurred_at) as month,
	   SUM(total_amt_usd) as total
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'  # remove the sales from 2013 and 2017
GROUP BY 1
ORDER BY 2 DESC;

# 3. Which year did Parch & Posey have the greatest sales in terms
# of total number of orders? Are all years evenly represented by the dataset?

SELECT DATE_TRUNC('year', occurred_at) as year,
	   COUNT(*) as total_sales
FROM orders
GROUP BY 1
ORDER BY 2 DESC;


# 4. Which month did Parch & Posey have the greatest sales in terms of total
# number of orders? Are all months evenly represented by the dataset?

SELECT DATE_TRUNC('month', occurred_at) as month,
	   COUNT(*) as total_sales 
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY 1
ORDER BY 2 DESC;

# 5. In which month of which year did Walmart spend the most on gloss paper in terms of dollars?

SELECT DATE_TRUNC('month', occurred_at) as month,
	   SUM(o.gloss_amt_usd) as gloss_paper_usd

FROM orders o
JOIN accounts a
ON a.id = o.account_id
WHERE a.name = 'Walmart'
GROUP BY 1
ORDER BY 2 DESC;