1# Count the number of Non NULL rating fields in the Customers table (including repeats)
SELECT COUNT(*) FROM customer WHERE rating IS NOT NULL;

2#Write a query that gives the names of both the salesperson and the customer for each order after the order number
SELECT salespeople.SNAME,customer.CNAME,orders.ONUM FROM (customer INNER JOIN orders ON orders.CNUM=customer.CNUM) INNER JOIN salespeople ON customer.SNUM=salespeople.Snum;

3#Count the number of Salespeople registering orders for each day. (If a salespersons has more than one order on given day, he or she should be counted only once).
SELECT orders.ODATE,COUNT(DISTINCT orders.SNUM) FROM orders GROUP BY orders.ODATE;


4# Find all orders attributed to salespeople in London.
SELECT * FROM orders 
INNER JOIN 
salespeople
ON salespeople.SNUM = orders.SNUM AND salespeople.CITY="London";

5#Find all salespeople who have customers with more than one current order
SELECT SALESPEOPLE.SNAME, COUNT(*) FROM SALESPEOPLE INNER JOIN CUSTOMER ON SALESPEOPLE.SNUM = CUSTOMER.SNUM 
INNER JOIN ORDERS ON SALESPEOPLE.SNUM=ORDERS.SNUM GROUP BY SALESPEOPLE.SNAME HAVING COUNT(*)>1;

6#  Write a query that selects all customers whose names begins with ‘C’.
SELECT * FROM customer WHERE cname LIKE 'C%';

7#  Write a query on the Customers table that will find the highest rating in each city. Put the output in this form: for the City (city) the highest rating is: (rating)
SELECT city,MAX(rating) FROM customer GROUP BY city;

8#  Write a query that selects each customer’s smallest order.
SELECT MIN(amt) FROM orders GROUP BY cnum;

9#Write a query that selects the first customer in alphabetical order whose name begins with G
SELECT cname FROM customer WHERE cname LIKE 'G%' LIMIT 1;

10#Write a query that counts the number of different non NULL city values in the Customers table
SELECT COUNT(*) FROM customer WHERE city IS NOT NULL;

11#  Find the average amount from the Orders table.
SELECT AVG(amt) FROM orders;

12#  Find all customers who are not located in San Jose and whose rating is above 200.
SELECT * FROM customer WHERE NOT city='SANJOSE' AND rating>200;

13#  Does the customer who has placed the maximum number of orders have the maximum rating? 
SELECT CASE WHEN EE = dd THEN 'Y' ELSE 'N' END AS Res 
FROM (
SELECT  A.CNAME, A.RATING, COUNT(o.onum)  AS dd,
(SELECT MAX(dd) FROM (
SELECT COUNT(ONUM) AS dd, CNUM  FROM Orders
GROUP BY CNUM) a) AS EE
FROM Customer A
INNER JOIN Orders o
ON A.Cnum = O.Cnum
WHERE Rating = (SELECT MAX(rating) FROM Customer)
GROUP BY A.CNAME, A.RATING
ORDER BY dd DESC LIMIT 1) B

14#Find all records in the Customer table with NULL values in the city column
SELECT * FROM customer WHERE city IS NULL;

15#Arrange the Orders table by descending customer number.
SELECT * FROM orders ORDER BY cnum DESC;

16#Find which salespeople currently have orders in the Orders table.
SELECT DISTINCT snum FROM orders WHERE onum IS NOT NULL;

17#Find the names and numbers of all salespeople who had more the one customer.
SELECT snum FROM customer GROUP BY snum HAVING COUNT(cnum)>1;

18#Count the orders of each of the salespeople and output the results in descending order.
SELECT  snum,COUNT(*) FROM orders GROUP BY snum ORDER BY COUNT(*) DESC;

19#List the Customer table if and only if one or more of the Customers in the Customer table are located in San Jose.
SELECT * FROM customer WHERE city='sanjose';

20#Find the largest order taken by each salesperson.
SELECT MAX(amt) FROM orders GROUP BY snum;

21#Find customers in San Jose who have a rating above 200.
SELECT * FROM customer WHERE city='SanJose' AND rating>200;

22#List all the orders of salesperson Motika from the Orders table.
SELECT * FROM orders INNER JOIN salespeople ON orders.SNUM=salespeople.SNUM AND salespeople.SNAME='motika';

23#Find salespeople who have multiple customers.
SELECT * FROM salespeople INNER JOIN customer ON salespeople.SNUM=customer.SNUM GROUP BY customer.SNUM HAVING COUNT(*)>1;


24#Find salespeople with customers located in their city.
SELECT * FROM salespeople INNER JOIN customer ON salespeople.CITY=customer.CITY;


25#Find the largest orders for serres and Rifkin.
SELECT MAX(amt) FROM orders WHERE orders.SNUM IN(SELECT snum FROM salespeople WHERE sname='serres' OR sname='rikklin') GROUP BY orders.SNUM;

26#Find all salespeople that are located in either Barcelona or London.
SELECT * FROM salespeople WHERE city='barcelona' OR city='london';

27#Find all salespeople with only one customer.
SELECT * FROM salespeople INNER JOIN customer ON salespeople.SNUM=customer.SNUM GROUP BY customer.SNUM HAVING COUNT(customer.CNUM)=1;


28#Find salespeople whose sales is greater the avg sales
SELECT * FROM salespeopl