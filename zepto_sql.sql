drop table if exists zepto;

CREATE TABLE zepto (
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountpercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGrams INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);

--data exploration:

--count of rows
SELECT COUNT(*) FROM zepto;

--sample data
SELECT * FROM zepto
WHERE name IS NULL
OR
   category IS NULL
OR 
mrp IS NULL
OR 
discountpercent IS NULL
OR
discountedSellingPrice IS NULL
OR
weightInGrams IS NULL
OR 
availableQuantity IS NULL
OR 
outOfStock IS NULL
OR 
quantity IS NULL;

--different product categories
SELECT DISTINCT category
FROM zepto
ORDER BY category;

--products in stock vs out of stock
SELECT outofstock,COUNT(sku_id)
FROM zepto
GROUP BY outofstock;

--product names present mulitple times
SELECT  name, COUNT(sku_id)as "number of SKUs"
FROM zepto
GROUP BY name
HAVING count(sku_id)>1
ORDER BY COUNT(sku_id) DESC;

--data cleaning:

--products with price=0
SELECT * FROM zepto
WHERE mrp = 0 OR discountSellingPrice = 0;

DELETE FROM zepto 
WHERE mrp=0;

--convert paisa to rupees
UPDATE zepto
SET mrp=mrp/100.0,
discountsellingprice=discountsellingprice /100.0;

SELECT mrp, discountsellingprice  FROM zepto



--1. Find the top 10 best-value products based on the discount percentage.
select distinct name,mrp,discountpercent
from zepto
order by discountpercent desc
limit 10;

--2. What are the products with high MRP but out of stock.
select distinct name,mrp
from zepto
where outofstock=true and mrp>300
order by mrp desc;

--3. Calculate estimated revenue for each category.
select category,
sum(discountsellingprice*availablequantity) as total_revenue
from zepto
Group by category
order by total_revenue;

--4. Find all products where MRP is greater then  500(rs) and discount is less than 10%.
select distinct name,mrp,discountpercent
from zepto
where mrp>500 and discountpercent< 10
order by mrp desc,discountpercent desc;

--5. Identify the top 5 categories offering the highest average discount percentage.
select category,
round(avg(discountpercent),2) as avg_discount
from zepto
group by category
order by avg_discount desc
limit 5;

--6. Find the price per gram from products above 100g and sort by best value.
select distinct name, weightingrams, discountsellingprice,
round(discountsellingprice/weightingrams,2) as price_per_gram
from zepto 
where weightingrams>= 100
order by price_per_gram;

--7. Group the products into categories like low,medium,bulk.
select distinct name,weightingrams,
case when weightingrams<1000 then 'low'
when weightingrams<5000 then 'medium'
else 'bulk'
end as weight_category
from zepto;

--8. What is the total inventory weight category.
select category,
sum(weightingrams*availablequantity) as total_weight
from zepto
group by category
order by total_weight;
