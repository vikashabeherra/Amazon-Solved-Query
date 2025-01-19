--Amozon Project 

-- Create Category Table
CREATE TABLE category 
(
	category_id INT PRIMARY KEY ,
	category_name VARCHAR (20)
);

-- Create Customer Table
CREATE TABLE customers
(
	customer_id	INT PRIMARY KEY ,
	first_name VARCHAR(10),
	last_name VARCHAR(10),
	state VARCHAR(15),
	address VARCHAR(5) DEFAULT ('xxxx')
);

-- Create Seller Table
CREATE TABLE sellers
(
	seller_id INT PRIMARY KEY ,
	name VARCHAR (15),
	origin VARCHAR (15)
);

-- Create Product Table 
CREATE TABLE products
(
	product_id INT PRIMARY KEY ,	
	product_name VARCHAR (20),
	price FLOAT ,
	cogs FLOAT ,
	category_id INT, --FK
	CONSTRAINT product_fk_category FOREIGN KEY (category_id) REFERENCES category (category_id)
);

 --Create Orders Table
 CREATE TABLE orders
 (
	order_id INT PRIMARY KEY ,
	order_date DATE ,
	customer_id	INT ,--FK
	seller_id INT ,--FK
	order_status VARCHAR(15),
	CONSTRAINT orders_fk_customers FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
	CONSTRAINT orders_fk_sellers FOREIGN KEY (seller_id) REFERENCES sellers (seller_id)
 );

--Create Order Item Table
CREATE TABLE order_items
(
	order_item_id INT PRIMARY KEY ,
	order_id INT ,-- FK
	product_id	INT ,--FK
	quantity INT,
	price_per_unit FLOAT,
	CONSTRAINT order_items_fk_orders FOREIGN KEY (order_id) REFERENCES orders (order_id),
	CONSTRAINT order_items_fk_products FOREIGN KEY (product_id) REFERENCES products (product_id)
);

--Create Payment Table
CREATE TABLE payments
(
	payment_id INT PRIMARY KEY ,	
	order_id INT ,--FK
	payment_date DATE,	
	payment_status VARCHAR(15),
	CONSTRAINT payments_fk_orders FOREIGN KEY (order_id) REFERENCES orders (order_id)
);

--Create Shipping Table
CREATE TABLE shippings
(
	shipping_id INT PRIMARY KEY,
	order_id INT , --FK
	shipping_date DATE,	
	return_date	 DATE,
	shipping_provider VARCHAR(10),
	delivery_status VARCHAR(15),
	CONSTRAINT shipping_fk_orders FOREIGN KEY (order_id) REFERENCES orders (order_id)
);

--Create Inventory Table
CREATE TABLE inventory
(
	inventory_id INT PRIMARY KEY ,
	product_id INT,--FK
	stock INT,
	warehouse_id INT,
	last_stock_date DATE,
	CONSTRAINT inventory_fk_products FOREIGN KEY (product_id) REFERENCES products (product_id)
);

--End Of Schemas

-- Show All Table Data
SELECT * FROM category;
SELECT * FROM customers;
SELECT * FROM inventory;
SELECT * FROM order_items;
SELECT * FROM orders;
SELECT * FROM payments;
SELECT * FROM products;
SELECT * FROM sellers;
SELECT * FROM shippings;

