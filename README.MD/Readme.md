# SQL E-Commerce Customer, Order & Items Database Analytics

A hands-on SQL project focused on relational database management, e-commerce data exploration, advanced SQL queries, and customer and product analytics using MySQL.

## Project Overview

This project demonstrates how SQL can be used to manage, retrieve, combine, and analyze e-commerce data stored across relational database tables.

The project works with three primary tables: `customers`, `orders`, and `items`. It covers database management, data relationships, SQL JOINs, aggregate functions, window functions, ranking techniques, and Common Table Expressions (CTEs).

The goal is to strengthen practical SQL skills and demonstrate analytical techniques relevant to Data Analyst, Business Analyst, and SQL Developer roles.

## Project Objectives

- Work with relational databases using MySQL.
- Understand and manage customer, order, and product data.
- Practice SQL DDL and DML operations.
- Explore relationships between multiple tables.
- Apply aggregate functions to summarize data.
- Use window functions for advanced analytical calculations.
- Rank products and compare records within groups.
- Analyze customer ordering patterns.
- Write readable, structured, and reusable SQL queries.

## Tools & Technologies

- **Database:** MySQL
- **SQL Environment:** MySQL Workbench
- **Query Language:** SQL
- **Version Control:** Git and GitHub
- **Data Format:** CSV

## Dataset Description

The project uses three CSV datasets.

| Dataset | Description |
|---|---|
| `customers.csv` | Customer records and customer identifiers. |
| `orders.csv` | Order records, customer references, product references, and order dates. |
| `items.csv` | Item details, item categories, and item prices. |

The exact columns and relationships depend on the source dataset and database schema.

## Database Structure

### 1. Customers

Stores customer information and identifiers.

### 2. Orders

Stores order information and links orders to customers and items.

### 3. Items

Stores product or item information, including names, categories, and prices.

### Relationships

- One customer can have multiple orders.
- Each order can reference a customer.
- Orders reference items through item identifiers.
- Primary and foreign keys can be used to maintain data integrity.

## SQL Concepts Implemented

### 1. Database Management

- Creating and selecting a database schema.
- Inspecting tables and records.
- Modifying column definitions.
- Managing table structures.

### 2. Data Retrieval and Filtering

- `SELECT`
- `WHERE`
- `ORDER BY`
- Selecting specific columns and retrieving complete records.

### 3. Aggregate Functions

- `MAX()` — maximum item price.
- `MIN()` — minimum item price.
- `AVG()` — average item price.
- `SUM()` — cumulative or grouped totals.
- `COUNT()` — counting orders and records.

### 4. SQL JOINs

Combining information from related tables using JOIN operations.

- `INNER JOIN`
- `LEFT JOIN`
- `RIGHT JOIN`

### 5. GROUP BY Analysis

Grouping records to calculate metrics such as:

- Maximum item price by item type.
- Minimum item price by item type.
- Average item price by item type.
- Number of orders per customer.

### 6. Window Functions

Using window functions to perform calculations across related rows without collapsing individual records.

Key concepts include:

- `OVER()`
- `PARTITION BY`
- `ORDER BY`

### 7. Ranking Functions

Applying ranking functions to compare records and assign rankings.

- `RANK()`
- `DENSE_RANK()`
- `ROW_NUMBER()`

Example applications include ranking items by price and comparing items within their respective categories.

### 8. Advanced Analytical Functions

- `LAG()` — accessing a previous row's value.
- `LEAD()` — accessing a subsequent row's value.

These functions can help compare item prices across a customer's order history when the rows are ordered chronologically.

### 9. Common Table Expressions (CTEs)

Using the `WITH` clause to organize complex queries into readable intermediate result sets.

### 10. Running Totals

Using window functions to calculate cumulative item-price totals over an ordered sequence of records.

## Example SQL Queries

### 1. Find the Maximum Item Price

```sql
SELECT MAX(item_price) AS maximum_item_price
FROM items;
```

### 2. Compare Maximum Item Prices by Category

```sql
SELECT
    item_name,
    item_type,
    MAX(item_price) OVER (
        PARTITION BY item_type
    ) AS category_max_price
FROM items;
```

### 3. Summarize Prices by Item Type

```sql
SELECT
    item_type,
    MAX(item_price) AS maximum_price,
    MIN(item_price) AS minimum_price,
    ROUND(AVG(item_price), 2) AS average_price
FROM items
GROUP BY item_type;
```

### 4. Calculate a Running Total of Item Prices

```sql
SELECT
    o.order_id,
    o.order_date,
    i.item_name,
    i.item_price,
    SUM(i.item_price) OVER (
        ORDER BY o.order_date, o.order_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_total
FROM orders AS o
JOIN items AS i
    ON o.item_id = i.item_id;
```

This calculates a running total of item prices across the ordered result set. It does not necessarily represent actual sales revenue.

### 5. Rank Items by Price Within Each Category

```sql
SELECT
    item_name,
    item_type,
    item_price,
    DENSE_RANK() OVER (
        PARTITION BY item_type
        ORDER BY item_price DESC
    ) AS price_rank
FROM items;
```

###