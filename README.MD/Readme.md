# SQL E-Commerce Database Analysis Project

## Project Overview

This project demonstrates the use of SQL for managing and analyzing e-commerce data using **MySQL**. It focuses on relational database design, data integrity, and extracting meaningful business information through SQL queries.

The database contains customer information, order records, and product details. SQL queries are used to combine data from multiple tables and explore relationships between customers, orders, and products.

## Objectives

- Design and manage a relational e-commerce database.
- Create and modify database tables using DDL commands.
- Apply primary keys and foreign key constraints.
- Retrieve and analyze records using SQL queries.
- Combine multiple tables using different types of JOINs.
- Develop practical SQL skills relevant to data analysis and database management.

## Tools & Technologies

- **Database:** MySQL
- **SQL Environment:** MySQL Workbench
- **Language:** Structured Query Language (SQL)
- **Key Concepts:** DDL, DML, Primary Keys, Foreign Keys, INNER JOIN, LEFT JOIN, RIGHT JOIN, and relational data modeling.

## Database Structure

The project includes three main tables:

| Table | Description |
|---|---|
| `customers` | Stores customer information and customer identifiers. |
| `orders` | Stores order details, customer references, and order dates. |
| `items` | Stores product names, categories, prices, and stock information. |

### Relationships

- A customer can place multiple orders.
- Each order is associated with a customer.
- Orders can reference products through product identifiers.
- Primary and foreign keys help maintain referential integrity.

## SQL Concepts Implemented

### 1. Database and Table Management
Creating a database, inspecting tables, and modifying column definitions.

### 2. Data Integrity
Applying primary key and foreign key constraints to establish relationships between tables.

### 3. Data Retrieval
Using `SELECT` statements to retrieve records and inspect table contents.

### 4. Table Joins
Using SQL JOIN operations to combine customer, order, and product information.

### 5. Relational Data Analysis
Exploring how customer records, orders, and product details connect within a relational database.

## Example SQL Query

The following query combines order information with customer and product details:

```sql
SELECT
    o.order_id,
    c.customer_id,
    c.first_name,
    i.item_name,
    o.order_date
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN items AS i
    ON o.item_id = i.item_id;
```

*Note: Adjust column names if they differ in your actual database schema.*

## Business Applications

This project demonstrates foundational SQL techniques applicable to:

- E-commerce order management
- Customer data analysis
- Product and inventory management
- Relational database development
- Data extraction for reporting and business intelligence

## Repository Structure

```text
SQL-Ecommerce-Database-Analysis/
│
├── README.md
├── SQL_Scripts/
│   └── ecommerce_analysis.sql
├── Dataset/
│   └── customers.csv
│   └── orders.csv
│   └── items.csv
└── Screenshots/
    └── mysql_workbench.png
```

*The folder structure above is a suggested organization. Include only the files that are actually present in your repository.*

## Key Learning Outcomes

- Practical experience with MySQL Workbench.
- Understanding of relational database relationships.
- Hands-on practice with SQL JOIN operations.
- Experience troubleshooting database constraints and SQL errors.
- Improved ability to structure SQL scripts for portfolio projects.

## Future Improvements

- Add aggregate functions such as `SUM()`, `COUNT()`, and `AVG()`.
- Analyze sales and order trends.
- Identify top-selling products and high-value customers.
- Add views and subqueries for reusable analysis.
- Build a Power BI dashboard using the database results.

## Author

**Sadeeq**  
Aspiring Data Analyst | SQL | MySQL | Power BI

- GitHub: https://github.com/sadeeqanalyst
- LinkedIn: https://www.linkedin.com/in/muhammad-sadeeq-22092a292

---

If you find this project useful, consider giving the repository a ⭐ on GitHub.
