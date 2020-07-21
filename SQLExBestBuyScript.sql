-- SQL Exercise Using bestbuy database:  Assigend 07/20/2020 

-- Basic Query Exercises

-- #1 find all products
SELECT * FROM products;

-- #2 find all products that cost $1400
SELECT * FROM products
WHERE Price = 1400;

-- #3 find all products that cost 11.99 or 13.99
SELECT * FROM products
-- WHERE Price = 11.99 OR Price= 13.99;
-- The between can also be used
WHERE price BETWEEN 11.99 AND 13.99;

-- #4 find all products that do NOT cost 11.99 - using NOT
SELECT * FROM products
WHERE NOT (Price = 11.99 OR Price= 13.99);

-- #5 ind all products and sort them by price from greatest to least
SELECT * FROM products
ORDER BY Price desc;

-- #6 find all employees who don't have a middle initial
SELECT * FROM employees
WHERE MiddleInitial IS NULL;

-- #7 find distinct product prices
SELECT DISTINCT price FROM products;

-- #8 find all employees whose first name starts with the letter ‘j’
SELECT * FROM employees
WHERE FirstName LIKE 'J%';

-- #9 find all Macbooks 
SELECT * FROM products
WHERE name Like '%Macbook%';

-- #10 find all products that are on sale
SELECT * FROM products 
-- Where OnSale = 1;  or the following can be done as well
WHERE OnSale = true;

-- #11 find the average price of all products --
SELECT ROUND(AVG(price),2) AS 'Average Price' FROM products;

-- #12 find all Geek Squad employees who don't have a middle initial --
SELECT * FROM employees
WHERE title ='Geek Squad' AND MiddleInitial IS NULL;

-- #13 find all products from the products table whose stock level is in the range of 500 to 1200.
--     Order by Price from least to greatest. **Try this with the between keyword**
SELECT * FROM products
WHERE StockLevel BETWEEN 500 and 1200
ORDER BY price, StockLevel desc;

-- JOIN Exercises 
/* #1 - joins: select all the computers from the products table:
   using the products table and the categories table, 
   return the product name and the category name  
*/

-- #1 - Using the WHERE Statement
SELECT products.name, categories.name
FROM products, categories
WHERE products.CategoryID = categories.CategoryID AND categories.name ='computers'; 

-- #1 - Using the INNER JOIN Statement
SELECT products.name AS 'Product Name', categories.name AS 'Category Name'
FROM products 
INNER JOIN categories
ON products.CategoryID = categories.CategoryID AND categories.name ='computers'; 

-- #2 joins: find all product names, product prices, and products ratings that have a rating of 5
-- #2 Using the WHERE
SELECT p.name, p.Price, r.Rating
FROM products AS p, reviews AS r
WHERE p.ProductID = r.ProductID AND r.Rating = 5;

-- #2 joins: find all product names, product prices, and products ratings that have a rating of 5
-- #2 Using the INNER JOIN Statement
SELECT p.name AS 'Product Name', p.Price, r.Rating
FROM products AS p
INNER JOIN  reviews AS r
ON p.ProductID = r.ProductID AND r.Rating = 5;

-- #3 joins: -- Find the employee with the most total quantity sold.  Use the sum() function and group by
-- Using the WHERE option
SELECT SUM(s.Quantity) AS 'Quantity', e.FirstName, e.LastName
FROM sales AS s, employees AS e
WHERE e.EmployeeID = s.EmployeeID
GROUP BY s.EmployeeID
ORDER BY SUM(s.Quantity) DESC LIMIT 2;

-- Using the INNER JOIN
SELECT SUM(s.Quantity) AS 'Quantity', e.FirstName, e.LastName
FROM sales AS s  
INNER JOIN employees AS e
ON e.EmployeeID = s.EmployeeID
GROUP BY s.EmployeeID
ORDER BY SUM(s.Quantity) DESC LIMIT 2;

-- #4 joins: find the name of the department, and the name of the category for Appliances and Games
SELECT d.name AS 'Department Name', c.name'Category Name'
FROM departments as d
INNER JOIN categories as c
ON d.DepartmentID = c.DepartmentID AND c.name ='appliances' OR c.name='games';

-- #5 joins: find the product name, total # sold, and total price sold,
--    for Eagles: Hotel California --You may need to use SUM()
SELECT p.name as 'Product Name', SUM(s.Quantity) AS 'Total Sold' , (p.price * SUM(s.Quantity)) AS 'Total Price Sold'
FROM products as p 
INNER JOIN sales as s
ON p.productID = s.productID AND p.name ='Eagles: Hotel California';

-- #6 joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!)
SELECT p.name AS 'Product Name', r.Reviewer, r.rating, r.comment 
FROM reviews as r
INNER JOIN products as p
ON p.ProductID = r.ProductID AND p.name ='Visio TV' 
ORDER BY  r.rating LIMIT 1;

-- Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */

SELECT e.employeeID, e.FirstName, e.LastName,  p.name AS 'Product Name', s.Quantity, (p.price * quantity) AS 'Sales Amount' 
FROM sales as s
INNER JOIN employees as e ON e.employeeID = s.employeeID 
INNER JOIN products as p ON p.ProductID = s.ProductID
ORDER BY e.lastname, e.FirstName;



