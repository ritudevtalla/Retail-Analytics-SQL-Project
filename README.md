Retail Analytics SQL Project
Project Overview

This project analyzes retail sales transactions to generate business insights related to:

Product Performance
Customer Purchase Behavior
Customer Segmentation
Sales Trends
Revenue Growth
Customer Loyalty

The objective is to help retail organizations improve marketing effectiveness, inventory planning, and customer retention.

Business Problem

Retail companies often struggle with:

Duplicate and inconsistent transaction records
Missing customer information
Difficulty identifying top-performing products
Lack of customer segmentation
Understanding sales growth trends
Identifying loyal and repeat customers

This project uses SQL to clean, transform, and analyze retail transaction data to solve these challenges.

Database Tables
Sales_Transaction
Column
TransactionID
CustomerID
ProductID
QuantityPurchased
Price
TransactionDate
Product_Inventory
Column
ProductID
ProductName
Category
Price
Customer_Profiles
Column
CustomerID
Age
Gender
Location
JoinDate
Project Tasks
Data Cleaning
Identify duplicate records
Remove duplicate transactions
Detect price mismatches
Correct transaction prices
Identify and replace null values
Clean date formats
Product Analysis
Total sales by product
Revenue by product
Top 10 products by revenue
Bottom 10 products by units sold
Category-wise performance analysis
Customer Analysis
Purchase frequency analysis
High-frequency customers
Low-frequency customers
Repeat purchase analysis
Customer loyalty analysis
Sales Trend Analysis
Daily sales trends
Month-over-Month (MoM) Growth Analysis
Customer Segmentation

Customers are segmented based on quantity purchased:

Segment	Quantity Purchased
Low	1-10
Medium	11-30
High	30+
Key Insights
Product Insights
Identified highest revenue generating products.
Identified slow-moving products requiring promotion.
Evaluated category performance for marketing decisions.
Customer Insights
Identified loyal customers.
Identified repeat purchase behavior.
Segmented customers into Low, Medium and High value groups.
Revenue Insights
Tracked daily sales trends.
Calculated Month-over-Month growth rate.
Measured customer contribution to revenue.SQL Concepts Used
CTEs
Aggregate Functions
Window Functions
CASE Statements
JOINs
GROUP BY
HAVING
Data Cleaning Techniques
Table Creation and Alteration
Tools Used
MySQL
MySQL Workbench
GitHub
Project Outcome

The project demonstrates end-to-end SQL analysis capabilities including:

Data Cleaning
Data Transformation
Exploratory Data Analysis
Customer Analytics
Product Analytics
Business Insight Generation
