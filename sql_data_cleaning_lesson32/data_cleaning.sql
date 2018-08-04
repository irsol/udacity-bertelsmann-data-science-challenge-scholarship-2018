# LEFT and RIGHT QUIZZES.

# 1. In the accounts table, there is a column holding the website for each company.
# The last three digits specify what type of web address they are using.
# Pull these extensions and provide how many of each website type exist in the
# accounts table.


SELECT RIGHT(website, 3) AS web_address, COUNT(*) num_companies
FROM accounts
GROUP BY 1
ORDER BY 2 DESC;


# 2.
/*
There is much debate about how much the name (or even the first letter of a company name)
matters. Use the accounts table to pull the first letter of each company name to see the
distribution of company names that begin with each letter (or number).
*/

SELECT LEFT(UPPER(name), 1) AS first_char, COUNT(*) num_companies
FROM accounts
GROUP BY 1
ORDER BY 2 DESC;

# 3. Use the accounts table and a CASE statement to create two groups: one group
# of company names that start with a number and a second group of those company names that
# start with a letter. What proportion of company names start with a letter?

SELECT SUM(num) nums, SUM(letter) letters
FROM (SELECT name, CASE WHEN LEFT(UPPER(name), 1) IN ('0','1','2','3','4','5','6','7','8','9') 
                       THEN 1 ELSE 0 END AS num, 
         CASE WHEN LEFT(UPPER(name), 1) IN ('0','1','2','3','4','5','6','7','8','9') 
                       THEN 0 ELSE 1 END AS letter
      FROM accounts) t1;

# or

SELECT  SUM(CASE WHEN LEFT(name, 1) LIKE '^[0-9]' THEN 1 ELSE 0 END) AS num, 
        SUM(CASE WHEN LEFT(name, 1) LIKE '^[0-9]' THEN 0 ELSE 1 END) AS letter
 FROM accounts;


# 4. Consider vowels as a, e, i, o, and u. What proportion of company names start with a vowel,
# and what percent start with anything else?

#There are 80 company names that start with a vowel and 271 that start with other characters.
#Therefore 80/351 are vowels or 22.8%. Therefore, 77.2% of company names do not start with vowels.
SELECT SUM(vowels) vowels, SUM(other) other
FROM (SELECT name, CASE WHEN LEFT(UPPER(name), 1) IN ('A','E','I','O','U') 
                        THEN 1 ELSE 0 END AS vowels, 
          CASE WHEN LEFT(UPPER(name), 1) IN ('A','E','I','O','U') 
                       THEN 0 ELSE 1 END AS other
         FROM accounts) t1;
