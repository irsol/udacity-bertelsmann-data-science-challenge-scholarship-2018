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

/*3.*/