📦 Zepto Inventory Analysis (SQL Project)

📌 Project Overview:

The Zepto Inventory Analysis project focuses on analyzing inventory data using SQL to gain insights into stock levels, product availability, warehouse performance, and inventory management efficiency. This project demonstrates how SQL can be used for data cleaning, querying, and extracting meaningful business insights from inventory datasets.

🎯 Project Objectives:

Monitor inventory stock levels

Identify out-of-stock and low-stock products

Analyze product category performance

Track warehouse-wise inventory distribution

Improve inventory decision-making using data insights

🛠️ Tools & Technologies:

SQL (PostgreSQL / MySQL) – Data Analysis & Querying

Database Management System (pgAdmin / MySQL Workbench)

CSV Dataset – Zepto Inventory Data

📂 Dataset Description:

The dataset contains inventory-related details such as:

Product ID

Product Name

Category

Stock Quantity

Price

Warehouse Location

Supplier

Reorder Level

Inventory Status

🧹 Data Cleaning & Preparation (SQL):

Key steps performed:

Handling missing values

Removing duplicate records

Standardizing column names

Creating calculated fields

Data type conversion for numeric and date columns

🔍 SQL Analysis Performed:

Some important SQL queries used in this project:

Total inventory count by category

Low-stock product identification

Out-of-stock product analysis

Warehouse-wise stock distribution

Average price by category

Reorder level analysis

Example Query:

SELECT category, SUM(stock_quantity) AS total_stock
FROM zepto_inventory
GROUP BY category
ORDER BY total_stock DESC;

📊 Key Insights:

Certain categories have higher stock demand

Few products frequently reach low-stock levels

Inventory distribution varies across warehouses

Reorder level tracking helps prevent stockouts

🚀 How to Run the Project:

Import the Zepto inventory dataset into your SQL database

Create the required table (e.g., zepto_inventory)

Run SQL queries for analysis and insights

Use pgAdmin or MySQL Workbench to execute queries

📁 Project Structure:

dataset/ – Inventory dataset (CSV)

sql_queries.sql – SQL analysis queries

README.md – Project documentation
