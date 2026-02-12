use livejoins;
select * from customers;
select * from products;
select * from sales;
select * from sales_reprentative;
select * from suppliers;

-- Objective 1: Customer and Product Analysis
-- 1. What is the average spending per customer?

select CustomerID, avg(TotalAmount), FirstName from sales t1 join customers t2
on t1.CustomerID = t2.customer_id
group by t1.CustomerID,FirstName ;

-- 2. Which product is the most frequently purchased by customers?

select ProductID, count(ProductID), ProductName from sales t1 join products t2
on t1.ProductID = t2.product_id
group by t1.ProductID, t2.ProductName;

-- 3. How many unique customers made purchases in each city?

select StoreLocation, count(distinct(CustomerID)) from sales
group by StoreLocation
order by count(distinct(CustomerID)) desc;


-- 4. What is the distribution of product categories purchased by customers?

select ProductID, count(ProductID), category from sales t1 join products t2
on t1.ProductID = t2.product_id
group by ProductID, category;

-- 5. How many repeat customers are there in the dataset?

select CustomerID, count(CustomerID) from sales
group by CustomerID
order by count(CustomerID) desc;

-- 6. What is the average unit price of products purchased by customers?

select ProductID, (sum(TotalAmount)/sum(Quantity)) from sales
group by ProductID
order by ProductID;

-- 7. How does the spending behavior differ between customers from different states?

select  sum(TotalAmount), state  from sales t1 join customers t2 on
t1.CustomerID = t2.customer_id
group by state;


-- 8. Which supplier provides the most popular products?

select ProductID, sum(Quantity), SupplierID from sales t1 join products t2 on
t1.ProductID = t2.product_id
group by ProductID, SupplierID
order by sum(Quantity) desc ;

-- 9. What is the most common product category purchased by customers?

select ProductID, sum(Quantity), Category from sales t1 join products t2 on
t1.ProductID = t2.product_id
group by ProductID, Category
order by sum(Quantity) desc ;

-- 10. How many customers purchased more than one type of product?
select count(*) from (
select CustomerID, count(distinct(ProductID)) as 'number' from sales
group by CustomerID
order by number desc) as t1

where t1.number > 1 ;

-- Objective 2: Supplier and Product Performance
-- 11. What is the total sales amount for each supplier?
select SupplierID, sum(total) from (
select ProductID, sum(TotalAmount) as 'total', SupplierID from sales t1 join products t2 
 on t1. ProductID = t2.product_id
group by ProductID , SupplierID) t
group by t.SupplierID;

-- 12. Which supplier has the highest average unit price for their products?

select SupplierID, avg(UnitPrice) as 'avg' from products
group by SupplierID
order by avg desc;

-- 13. How many different products are provided by each supplier?

select SupplierID ,count(distinct product_id) from products
group by SupplierID;

-- 14. What is the average total sales amount for products supplied by each supplier?

select SupplierID,ProductID, sum(total) from (
select ProductID, sum(TotalAmount) as 'total', SupplierID from sales t1 join products t2 
 on t1. ProductID = t2.product_id
group by ProductID , SupplierID) t
group by t.SupplierID, t.ProductID ;

-- 15. Which supplier's products have the highest total sales quantity?

select SupplierID, sum(total) as 'sales_quantity' from (
select ProductID, sum(Quantity) as 'total', SupplierID from sales t1 join products t2 
 on t1. ProductID = t2.product_id
group by ProductID , SupplierID) t
group by t.SupplierID
order by sales_quantity desc;

