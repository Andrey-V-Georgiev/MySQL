# DROP SCHEMA `softuni_stores_system`;
 
# CREATE SCHEMA `softuni_stores_system`;

USE `softuni_stores_system`;

CREATE TABLE `pictures`(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    url VARCHAR(100) NOT NULL,
    added_on DATETIME NOT NULL
);

CREATE TABLE `categories`(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE `products`(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
   `name` VARCHAR(40) NOT NULL UNIQUE,
   best_before DATE,
   price DECIMAL(10, 2) NOT NULL,
   `description` TEXT,
   category_id INTEGER NOT NULL,
   picture_id INTEGER NOT NULL,
   CONSTRAINT fk_products_category_id FOREIGN KEY (category_id) REFERENCES categories(id),
   CONSTRAINT fk_products_picture_id FOREIGN KEY (picture_id) REFERENCES pictures(id)
);

CREATE TABLE `towns`(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE `addresses`(
	 id INTEGER PRIMARY KEY AUTO_INCREMENT,
     `name` VARCHAR(50) NOT NULL UNIQUE,
     town_id INTEGER NOT NULL,
     CONSTRAINT fk_addresses_town_id FOREIGN KEY (town_id) REFERENCES towns(id)
);

CREATE TABLE `stores`(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
     `name` VARCHAR(20) NOT NULL UNIQUE,
     rating FLOAT NOT NULL,
     has_parking BOOLEAN DEFAULT FALSE,
     address_id INTEGER NOT NULL,
     CONSTRAINT fk_stores_address_id FOREIGN KEY (address_id) REFERENCES addresses(id)
);

CREATE TABLE `products_stores`(
	product_id INTEGER NOT NULL,
    store_id INTEGER NOT NULL,
	PRIMARY KEY (product_id, store_id),
    CONSTRAINT fk_products_stores_product_id FOREIGN KEY (product_id) REFERENCES products(id),
	CONSTRAINT fk_products_stores_store_id FOREIGN KEY (store_id) REFERENCES stores(id)
);

CREATE TABLE `employees`(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(15) NOT NULL,
    middle_name CHAR,
	last_name VARCHAR(20) NOT NULL,
    salary DECIMAL (19, 2) DEFAULT 0,
    hire_date DATE NOT NULL,
    manager_id INTEGER,
    store_id INTEGER,
	CONSTRAINT fk_employees_manager_id FOREIGN KEY (manager_id) REFERENCES employees(id),
	CONSTRAINT fk_employees_store_id FOREIGN KEY (store_id) REFERENCES stores(id)
);

















