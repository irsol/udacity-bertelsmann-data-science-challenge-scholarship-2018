### Limits

SELECT occurred_at, account_id, channel
FROM web_events
LIMIT 15;

### ORDER BY

/*1.Write a query to return the 10 earliest orders in the orders table.
Include the id, occurred_at, and total_amt_usd.*/

SELECT id, occurred_at, total_amt_usd
FROM orders
LIMIT 10; 

/*2.Write a query to return the top 5 orders in terms of largest total_amt_usd.
Include the id, account_id, and total_amt_usd.*/

SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd  desc
LIMIT 5;

/*3.Write a query to return the bottom 20 orders in terms of least total.
Include the id, account_id, and total.*/

SELECT id, account_id, total
FROM orders
ORDER BY total
LIMIT 20;


## ORDER BY Part 2

/*Write a query that returns the top 5 rows from orders ordered according to newest to oldest,
but with the largest total_amt_usd for each date listed first for each date.*/

SELECT total_amt_usd
FROM orders
ORDER BY total_amt_usd desc
LIMIT 5;

/*Write a query that returns the top 10 rows from orders ordered according to oldest
to newest, but with the smallest total_amt_usd for each date listed first for each date.*/

SELECT total_amt_usd
FROM orders
ORDER BY total_amt_usd
LIMIT 10;

## WHERE

/*Pull the first 5 rows and all columns from the orders table that have
a dollar amount of gloss_amt_usd greater than or equal to 1000.*/

SELECT *
FROM orders
WHERE gloss_amt_usd >= 1000
LIMIT 5;

/*Pull the first 10 rows and all columns from the orders table that
have a total_amt_usd less than 500.*/

SELECT *
FROM orders
WHERE total_amt_usd < 500
LIMIT 10;


## WHERE with Non-Numeric Data

/*Filter the accounts table to include the company name, website, and the
primary point of contact (primary_poc) for Exxon Mobil in the accounts table.*/

SELECT name, website 
From accounts
WHERE primary_poc = 'Exxon Mobil';

## Arithmetic Operators

/*Using the orders table:

Create a column that divides the standard_amt_usd by the standard_qty to find the
unit price for standard paper for each order. Limit the results to the first 10 orders, and include the id and account_id fields.*/

SELECT standard_amt_usd, 
		standard_qty,
        id,
        account_id,
        standard_amt_usd / standard_qty AS unit_cost
FROM orders 
LIMIT 10;

/*Write a query that finds the percentage of revenue that comes from poster paper for each order. You will need to use only the columns
that end with _usd. (Try to do this without using the total column). Include the id and account_id fields.*/

SELECT  id,
        account_id,
        poster_amt_usd / (standard_amt_usd + gloss_amt_usd + poster_amt_usd ) AS poster_paper
FROM orders;

## LIKE

/*All the companies whose names start with 'C'. */

SELECT *
FROM accounts
WHERE name LIKE '%C%';

/*All companies whose names contain the string 'one' somewhere in the name.*/

SELECT *
FROM accounts
WHERE name LIKE '%one%';

/*All companies whose names end with 's'.*/

SELECT *
FROM accounts
WHERE name LIKE '%s%';

## IN
/*Use the accounts table to find the account name, primary_poc, and sales_rep_id for Walmart, Target, and Nordstrom.*/

SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom');

/*Use the web_events table to find all information regarding individuals who were contacted via the channel of organic or adwords.*/

SELECT channel
FROM web_events
WHERE channel IN ('organic', 'adwords');

## NOT

/*Use the accounts table to find the account name, primary poc, and sales rep id for all stores except Walmart, Target, and Nordstrom.*/

SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name NOT IN ('%Walmart%', '%Target%', '%Nordstrom%');

/*Use the web_events table to find all information regarding individuals who were contacted via any method except using organic or adwords methods.*/

SELECT *
FROM web_events
WHERE channel NOT IN ('%organic%', '%adwords%');

/*All the companies whose names do not start with 'C'.*/

SELECT name
FROM accounts
WHERE name NOT LIKE ('%C%');

/*All companies whose names do not contain the string 'one' somewhere in the name*/

SELECT name
FROM accounts
WHERE name NOT LIKE ('%one%');

/*All companies whose names do not end with 's'.*/

SELECT name
FROM accounts
WHERE name NOT LIKE ('%s%');