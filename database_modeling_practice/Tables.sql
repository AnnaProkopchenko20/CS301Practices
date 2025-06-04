CREATE DATABASE Store01;

USE Store01;

CREATE TABLE products (
	id int PRIMARY KEY AUTO_INCREMENT,
	name varchar(100),
	category varchar(100),
	price int UNSIGNED ,
	stock int UNSIGNED 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE customers (
	id int PRIMARY KEY AUTO_INCREMENT,
	name varchar(100),
	email varchar(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE orders (
	id int PRIMARY KEY AUTO_INCREMENT,
	order_date date,
	customer_id int NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customers(id)  ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE order_items (
	order_id int NOT NULL,
	product_id int NOT NULL,
	quantity int UNSIGNED,
	price int UNSIGNED ,
	FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
	FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO customers (name, email) VALUES
('Alice Johnson', 'alice.johnson@example.com'),
('Bob Smith', 'bob.smith@example.com'),
('Clara Martinez', 'clara.martinez@example.com');

INSERT INTO products (name, category, price, stock) VALUES
('Wireless Mouse', 'Electronics', 25, 150),
('Bluetooth Speaker', 'Electronics', 60, 80),
('Coffee Mug', 'Kitchenware', 12, 200),
('Notebook', 'Stationery', 5, 500),
('LED Desk Lamp', 'Home Decor', 30, 90);


INSERT INTO orders (order_date, customer_id) VALUES
('2025-05-02', 1),
('2025-05-05', 2),
('2025-05-07', 3),
('2025-05-10', 2),
('2025-05-12', 1),
('2025-05-13', 3),
('2025-05-15', 1),
('2025-05-17', 2),
('2025-05-19', 3),
('2025-05-21', 1),
('2025-05-23', 2),
('2025-05-25', 3),
('2025-05-27', 1),
('2025-05-29', 2),
('2025-05-31', 3);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 2, 25),
(1, 3, 1, 12),
(2, 2, 1, 60),
(2, 4, 3, 5),
(3, 5, 2, 30),
(3, 1, 1, 25),
(3, 3, 2, 12),
(4, 4, 4, 5),
(4, 2, 1, 60),
(5, 3, 3, 12),
(5, 5, 1, 30),
(6, 1, 2, 25),
(6, 2, 1, 60),
(7, 4, 3, 5),
(7, 3, 1, 12),
(8, 5, 2, 30),
(8, 1, 2, 25),
(9, 2, 1, 60),
(9, 4, 2, 5),
(10, 3, 4, 12),
(10, 5, 1, 30),
(11, 1, 3, 25),
(11, 2, 1, 60),
(12, 3, 2, 12),
(12, 4, 1, 5),
(13, 5, 1, 30),
(13, 1, 2, 25),
(13, 2, 1, 60),
(14, 3, 1, 12),
(14, 4, 3, 5),
(15, 5, 2, 30),
(15, 2, 1, 60);