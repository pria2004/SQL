# 📚 Online Bookstore Database System

This project demonstrates the design and implementation of a relational database system for an online bookstore. It covers complete SQL concepts including data definition, manipulation, querying, transaction control, and access control using a real-world scenario.

The system manages customers, books, categories, orders, and payments, and provides meaningful business insights using advanced SQL queries such as joins, aggregations, and window functions.

---

## 🛠️ Technologies Used

* **MySQL** – Database management system
* **SQL** – Query language (DDL, DML, DQL, TCL, DCL)

---

## ✨ Features

* Structured database design with relationships
* CRUD operations on all major entities
* Complex queries using joins and subqueries
* Aggregation using GROUP BY and functions
* Advanced analytics using window functions
* Transaction handling using COMMIT and ROLLBACK
* User access control using GRANT and REVOKE

---

## 📁 Project Structure

```id="f3s9pk"
bookstore-sql/
│
└── bookstore.sql   → Complete SQL script
```

---

## 🧠 Database Overview

The system includes the following tables:

* **customers** – Stores customer details
* **categories** – Stores book categories
* **books** – Contains book information
* **orders** – Tracks customer orders
* **order_items** – Links orders with books
* **payments** – Stores payment details

---

## ⚙️ Setup Instructions

1. Install MySQL on your system
2. Open MySQL Workbench or CLI
3. Run the SQL script:

   ```
   SOURCE bookstore.sql;
   ```
4. The database and tables will be created automatically

---

## ▶️ Usage

* Execute queries to perform CRUD operations
* Analyze data using joins and aggregations
* Use window functions for ranking and insights
* Test transaction control using COMMIT and ROLLBACK

---

## 📌 Key Concepts Demonstrated

* DDL – Table creation and schema design
* DML – Insert, update, delete operations
* DQL – Data retrieval and filtering
* TCL – Transaction management
* DCL – User permissions and access control
* Joins, Grouping, and Window Functions

---

## 📄 License

This project is created for educational purposes and can be modified for learning and practice.
