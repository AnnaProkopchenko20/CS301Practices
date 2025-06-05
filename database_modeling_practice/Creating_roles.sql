-- store_manager: ALL PRIVILEGES on the whole database
-- sales_clerk: SELECT on products, INSERT/SELECT on orders and order_items
-- analyst: SELECT only on all tables

CREATE ROLE store_manager;
GRANT ALL PRIVILEGES ON Store01.* TO store_manager;

CREATE ROLE sales_clerk;
GRANT SELECT ON Store01.products TO sales_clerk;
GRANT SELECT, INSERT ON Store01.orders TO sales_clerk;
GRANT SELECT, INSERT ON Store01.order_items TO sales_clerk;

CREATE ROLE analyst;
GRANT SELECT ON Store01.* TO analyst;

-- some users
CREATE USER 'store_manager1'@'localhost' IDENTIFIED BY 'secure1';
GRANT store_manager TO 'store_manager1'@'localhost';

CREATE USER 'sales_clerk1'@'localhost' IDENTIFIED BY 'secure2';
GRANT sales_clerk TO 'sales_clerk1'@'localhost';

CREATE USER 'analyst1'@'localhost' IDENTIFIED BY 'secure3';
GRANT analyst TO 'analyst1'@'localhost';