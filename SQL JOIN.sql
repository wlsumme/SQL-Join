/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT p.Name, c.Name FROM products AS p
INNER JOIN categories AS c
ON p.CategoryID = c.CategoryID
WHERE c.name = 'Computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.name, p.price, r.rating FROM products AS p
INNER JOIN reviews AS r
ON p.ProductID = r.ProductID
WHERE r.rating = 5;



 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, SUM(s.Quantity) AS 'Total' FROM sales AS s
INNER JOIN employees AS e
ON s.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID
ORDER BY Total DESC
LIMIT 10;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name AS 'dept', c.Name AS 'cat' FROM departments AS d
INNER JOIN categories AS c
ON d.DepartmentID = c.DepartmentID
WHERE c.name = 'Appliances' OR c.name = 'Games';


/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT p.name, SUM(s.quantity) AS 'total', SUM(s.quantity * s.priceperunit) AS 'totalprice' FROM sales AS s
 INNER JOIN products AS p
 ON s.ProductID = p.ProductID
 WHERE p.name = 'eagles: hotel california';
 
 

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.name, r.reviewer, r.rating, r.Comment FROM reviews AS r
INNER JOIN Products AS p
ON r.ProductID = p.ProductID 
WHERE p.name = 'Visio TV' AND r.rating = 1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */


SELECT e.EmployeeID, e.firstname, e.lastname, p.name AS 'product', s.quantity FROM sales AS s
INNER JOIN employees AS e 
ON s.EmployeeID = e.EmployeeID
INNER JOIN products AS p
ON s.ProductID = p.ProductID;

