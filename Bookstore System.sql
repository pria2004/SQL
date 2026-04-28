-- =========================================
-- 📚 ONLINE BOOKSTORE DATABASE SYSTEM
-- Covers: DDL, DML, DQL, TCL, DCL, JOINS, GROUP BY, WINDOW FUNCTIONS
-- =========================================

-- =========================================
-- 🔹 1. DDL (CREATE TABLES)
-- =========================================

CREATE DATABASE bookstore;
USE bookstore;

CREATE TABLE customers (
customer_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
email VARCHAR(100) UNIQUE,
city VARCHAR(50)
);

CREATE TABLE categories (
category_id INT AUTO_INCREMENT PRIMARY KEY,
category_name VARCHAR(100)
);

CREATE TABLE books (
book_id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(150),
price DECIMAL(10,2),
category_id INT,
FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE orders (
order_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT,
order_date DATE,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
order_item_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT,
book_id INT,
quantity INT,
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (book_id) REFERENCES books(book_id)
);

CREATE TABLE payments (
payment_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT,
amount DECIMAL(10,2),
payment_date DATE,
FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- =========================================
-- 🔹 2. DML (INSERT DATA)
-- =========================================

INSERT INTO customers (name, email, city) VALUES
('Varun', '[varun@gmail.com](mailto:varun@gmail.com)', 'Chennai'),
('Rahul', '[rahul@gmail.com](mailto:rahul@gmail.com)', 'Bangalore'),
('Anita', '[anita@gmail.com](mailto:anita@gmail.com)', 'Mumbai');

INSERT INTO categories (category_name) VALUES
('Programming'), ('Data Science'), ('Fiction');

INSERT INTO books (title, price, category_id) VALUES
('Java Basics', 500, 1),
('Python ML', 700, 2),
('AI Guide', 800, 2),
('Mystery Novel', 300, 3);

INSERT INTO orders (customer_id, order_date) VALUES
(1, '2025-01-01'),
(2, '2025-01-02'),
(1, '2025-01-03');

INSERT INTO order_items (order_id, book_id, quantity) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 1),
(3, 4, 3);

INSERT INTO payments (order_id, amount, payment_date) VALUES
(1, 1700, '2025-01-01'),
(2, 800, '2025-01-02'),
(3, 900, '2025-01-03');

-- =========================================
-- 🔹 3. DQL (BASIC QUERIES)
-- =========================================

-- View all customers
SELECT * FROM customers;

-- View all books above 500
SELECT * FROM books WHERE price > 500;

-- =========================================
-- 🔹 4. JOINS
-- =========================================

-- Orders with customer names
SELECT o.order_id, c.name, o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

-- Full order details
SELECT c.name, b.title, oi.quantity
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
JOIN books b ON oi.book_id = b.book_id;

-- =========================================
-- 🔹 5. GROUP BY + AGGREGATION
-- =========================================

-- Total revenue
SELECT SUM(amount) AS total_revenue FROM payments;

-- Revenue per customer
SELECT c.name, SUM(p.amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.name;

-- Books sold per category
SELECT cat.category_name, SUM(oi.quantity) AS total_books
FROM order_items oi
JOIN books b ON oi.book_id = b.book_id
JOIN categories cat ON b.category_id = cat.category_id
GROUP BY cat.category_name;

-- =========================================
-- 🔹 6. WINDOW FUNCTIONS (ADVANCED)
-- =========================================

-- Rank customers by spending
SELECT c.name,
SUM(p.amount) AS total_spent,
RANK() OVER (ORDER BY SUM(p.amount) DESC) AS rank_position
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.name;

-- Running total revenue
SELECT payment_date,
amount,
SUM(amount) OVER (ORDER BY payment_date) AS running_total
FROM payments;

-- Top selling books
SELECT b.title,
SUM(oi.quantity) AS total_sold,
ROW_NUMBER() OVER (ORDER BY SUM(oi.quantity) DESC) AS rank_no
FROM order_items oi
JOIN books b ON oi.book_id = b.book_id
GROUP BY b.title;

-- =========================================
-- 🔹 7. TCL (TRANSACTION CONTROL)
-- =========================================

START TRANSACTION;

INSERT INTO customers (name, email, city)
VALUES ('TestUser', '[test@gmail.com](mailto:test@gmail.com)', 'Delhi');

ROLLBACK;  -- Change to COMMIT to save

-- =========================================
-- 🔹 8. DCL (ACCESS CONTROL)
-- =========================================

CREATE USER 'readonly_user'@'localhost' IDENTIFIED BY 'password';

GRANT SELECT ON bookstore.* TO 'readonly_user'@'localhost';

REVOKE INSERT ON bookstore.* FROM 'readonly_user'@'localhost';

-- =========================================
-- END OF SCRIPT
-- =========================================
