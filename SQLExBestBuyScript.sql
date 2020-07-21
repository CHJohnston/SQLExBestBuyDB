-- SQL Exercise Using bestbuy database:  Assigend 07/20/2020 

-- find all products
SELECT * FROM products;

-- find all products that cost $1400
SELECT * FROM products
WHERE Price = 1400;

-- find all products that cost 11.99 or 13.99
SELECT * FROM products
WHERE Price = 11.99 OR Price= 13.99;

-- find all products that do NOT cost 11.99 - using NOT
SELECT * FROM products
WHERE NOT (Price = 11.99 OR Price= 13.99);

-- find  all products and sort them by price from greatest to least
SELECT * FROM products
ORDER BY Price desc;

-- find all employees who don't have a middle initial
SELECT * FROM employees
WHERE MiddleInitial IS NULL;

-- find distinct product prices
SELECT DISTINCT price FROM products;

-- find all employees whose first name starts with the letter ‘j’
SELECT * FROM employees
WHERE FirstName LIKE 'J%';

-- find all Macbooks 
SELECT * FROM products
WHERE name Like '%Macbook%';

-- find all products that are on sale
SELECT * FROM products 
Where OnSale = 1;

-- find the average price of all products --
SELECT AVG(price) AS 'Average Price' FROM products;

-- find all Geek Squad employees who don't have a middle initial --
SELECT * FROM employees
WHERE title ='Geek Squad' AND MiddleInitial IS NULL;

-- find all products from the products table whose stock level is in the range of 500 to 1200.
-- Order by Price from least to greatest. **Try this with the between keyword**
SELECT * FROM products
WHERE StockLevel BETWEEN 500 and 1200;

/* joins: select all the computers from the products table:
   using the products table and the categories table, 
   return the product name and the category name  
*/

SELECT products.name, categories.name
FROM products, categories
WHERE products.CategoryID = categories.CategoryID AND categories.name ='computers'; 

-- joins: find all product names, product prices, and products ratings that have a rating of 5
SELECT p.name, p.Price, r.Rating
FROM products AS p, reviews AS r
WHERE p.ProductID = r.ProductID AND r.Rating = 5;

-- joins: find the employee with the most total quantity sold.  use the sum() function and group by
SELECT SUM(s.Quantity), e.FirstName, e.LastName
FROM sales AS s, employees AS e
WHERE e.EmployeeID = s.EmployeeID
GROUP BY s.EmployeeID
ORDER BY SUM(s.Quantity) DESC 
LIMIT 2;





