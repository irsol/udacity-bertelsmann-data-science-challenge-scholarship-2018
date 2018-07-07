# JOIN practice

/*Try pulling all the data from the accounts table, and all the data from the orders table.*/
SELECT accounts.*, orders.*
FROM accounts
JOIN orders
ON accounts.id = orders.id;

/*Try pulling standard_qty, gloss_qty, and poster_qty from the orders table, and the website and the primary_poc from the accounts table.*/

SELECT orders.standard_qty, orders.gloss_qty, orders.poster_qty,
		accounts.website, accounts.primary_poc
FROM orders
JOIN accounts
ON orders.id = accounts.id;

# JOIN QUESTIONS PART 1

/*1.Provide a table for all web_events associated with account name of Walmart. There should be three columns. Be sure to include the primary_poc,
time of the event, and the channel for each event. Additionally, you might choose to add a fourth column to assure only Walmart events were chosen. */

SELECT web_events.occurred_at, accounts.primary_poc, web_events.channel
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
WHERE accounts.name LIKE '%Walmart%';

/*2.Provide a table that provides the region for each sales_rep along with their associated accounts. Your final table should include three
columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.*/

SELECT region, sales_reps, accounts AS f_table
FROM accounts
JOIN sales_reps
ON accounts.sales_rep_id = sales_reps.id
JOIN region
ON sales_reps.region_id = region.id;

/*3.Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. Your
final table should have 3 columns: region name, account name, and unit price. A few accounts have 0 for total, so I divided by (total + 0.01) to assure 
not dividing by zero.*/

SELECT region.name AS region_name, accounts.name AS account_name, orders.total_amt_usd/(orders.total + 0.01) AS unit_price
FROM orders
JOIN accounts ON orders.account_id = accounts.id
JOIN sales_reps ON accounts.sales_rep_id = sales_reps.id
JOIN region ON sales_reps.region_id = region.id;

## JOINs and Filtering. Quiz: Last Check

/*1.Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for the Midwest region. 
Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically
(A-Z) according to account name.*/

SELECT region.name AS Region, sales_reps.name AS SalesRepName, accounts.name AS AcountName
FROM accounts 
JOIN sales_reps 
ON accounts.sales_rep_id = sales_reps.id
JOIN region ON sales_reps.region_id = region.id
WHERE region.name = 'Midwest'
ORDER BY AcountName;

/*2.Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for accounts where the sales rep has a first
name starting with S and in the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the
accounts alphabetically (A-Z) according to account name.*/

SELECT region.name, sales_reps.name AS SalesRepName, accounts.name AS AcountName
FROM accounts 
JOIN sales_reps 
ON accounts.sales_rep_id = sales_reps.id
JOIN region 
ON sales_reps.region_id = region.id
WHERE region.name = 'Midwest' and sales_reps.name LIKE 'S%'
ORDER BY AcountName;

/*3.Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for accounts where the sales rep has a last name
starting with K and in the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts
alphabetically (A-Z) according to account name.*/

SELECT region.name, sales_reps.name AS SalesRepName, accounts.name AS AcountName
FROM accounts 
JOIN sales_reps 
ON accounts.sales_rep_id = sales_reps.id
JOIN region
ON sales_reps.region_id = region.id
WHERE region.name = 'Midwest' AND sales_reps.name LIKE '% K%'
ORDER BY AcountName;

/*4.Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. However, you should
only provide the results if the standard order quantity exceeds 100. Your final table should have 3 columns: region name, account name, and unit price. In order to avoid a
division by zero error, adding .01 to the denominator here is helpful total_amt_usd/(total+0.01).*/

SELECT region.name, accounts.name AS AcountName, orders.total_amt_usd/(orders.total + 0.01) AS unit_price
FROM orders 
JOIN accounts
ON orders.account_id = accounts.id
JOIN sales_reps 
ON accounts.sales_rep_id = sales_reps.id
JOIN region 
ON sales_reps.region_id = region.id
WHERE orders.standard_qty > 100;

/*5.Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. However, you should only provide
the results if the standard order quantity exceeds 100 and the poster order quantity exceeds 50. Your final table should have 3 columns: region name, account name, and unit price.
Sort for the smallest unit price first. In order to avoid a division by zero error, adding .01 to the denominator here is helpful (total_amt_usd/(total+0.01).*/

SELECT region.name, accounts.name AS AcountName, orders.total_amt_usd/(orders.total + 0.01) AS unit_price
FROM orders 
JOIN accounts
ON orders.account_id = accounts.id
JOIN sales_reps 
ON accounts.sales_rep_id = sales_reps.id
JOIN region 
ON sales_reps.region_id = region.id
WHERE orders.standard_qty > 100 AND poster_qty > 50
ORDER BY unit_price ASC;

/*6.Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. However, you should only provide
the results if the standard order quantity exceeds 100 and the poster order quantity exceeds 50. Your final table should have 3 columns: region name, account name, and unit price.
Sort for the largest unit price first. In order to avoid a division by zero error, adding .01 to the denominator here is helpful (total_amt_usd/(total+0.01). */

SELECT region.name, accounts.name AS AcountName, orders.total_amt_usd/(orders.total + 0.01) AS unit_price
FROM orders 
JOIN accounts
ON orders.account_id = accounts.id
JOIN sales_reps 
ON accounts.sales_rep_id = sales_reps.id
JOIN region 
ON sales_reps.region_id = region.id
WHERE orders.standard_qty > 100 AND poster_qty > 50
ORDER BY unit_price DESC;

/*7.What are the different channels used by account id 1001? Your final table should have only 2 columns: account name and the different channels. You can try SELECT DISTINCT to narrow
down the results to only the unique values.*/

SELECT DISTINCT web_events.channel, accounts.name
FROM web_events 
JOIN accounts
ON accounts.id = web_events.account_id
WHERE accounts.id = '1001';

/*8.Find all the orders that occurred in 2015. Your final table should have 4 columns: occurred_at, account name, order total, and order total_amt_usd.*/

SELECT orders.occurred_at, accounts.name, orders.total,
orders.total_amt_usd
FROM orders 
JOIN accounts
ON accounts.id = orders.account_id
WHERE orders.occurred_at BETWEEN '01-01-2015' AND '01-01-2016'
ORDER BY orders.occurred_at DESC;

