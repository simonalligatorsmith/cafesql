Drop database cafe;
CREATE DATABASE cafe;
USE cafe;

CREATE TABLE store (
    store_id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    store_phone CHAR(10),
    store_city VARCHAR(20),
    store_state CHAR(2)
);

-- phone number adjusted
INSERT INTO store (store_phone, store_city, store_state)
VALUES ('8011234567', 'Provo', 'UT');

-- employee table done 
CREATE TABLE employee (
	employee_id MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	store_id SMALLINT UNSIGNED,
	first_name VARCHAR(15),
	last_name VARCHAR(20),
	emp_birthdate DATE, 
	emp_email VARCHAR(35),
	emp_phone CHAR(10),
	start_date DATE,
	emp_city VARCHAR(20),
	emp_state CHAR(2),
    foreign key (store_id) references store(store_id)
);

-- needs test insert
INSERT INTO employee(store_id, first_name, last_name, emp_birthdate, emp_email, emp_phone, start_date, emp_city, emp_state)
VALUES(1, 'Sally', 'Davidson', '2001-03-02', 'saldavidson@hotmail.com', '8015672314', '2020-04-05', 'Provo', 'UT');

-- appliance table done 
CREATE TABLE appliance (
	appliance_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    store_id SMALLINT UNSIGNED,
    appliance_type VARCHAR(20),
    warranty_date DATE,
    last_cleaned_date DATETIME,
    service_date DATE,
    FOREIGN KEY (store_id) REFERENCES store(store_id)
);

-- appliance insert statement adjusted
INSERT INTO appliance (store_id, appliance_type, warranty_date, last_cleaned_date, service_date)
VALUES (1, 'Blender', '2025-06-30', '2023-11-02 12:30:30', '2023-12-15');

-- recipe table done
CREATE TABLE recipe (
	recipe_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    recipe_name VARCHAR(30),
    amount TINYINT UNSIGNED,
    instruction VARCHAR(10000),
    is_drink BOOL
);

-- insert adjusted
INSERT INTO recipe (recipe_name, amount, instruction, is_drink)
VALUES 
("Mango Smoothie", 2, 'Blend Water and Mango Smoothie Blend Together', 1);


-- Weak entity table that establishes the many to many relationship of recipe and appliance
-- AKA many appliances can be used in many different recipes
CREATE TABLE recipe_appliance (
	recipe_id TINYINT UNSIGNED,
	appliance_id TINYINT UNSIGNED,
    PRIMARY KEY (recipe_id, appliance_id),
	FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id),
	FOREIGN KEY (appliance_id) REFERENCES appliance(appliance_id)
	);

INSERT INTO recipe_appliance
values (1, 1);

-- expiration date can be null, if we're putting non-food items in the inventory like soft good products 
-- inventory table up to date
CREATE TABLE inventory (
    inventory_id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    product_id SMALLINT UNSIGNED,
    ingredient_id TINYINT UNSIGNED,
    store_id SMALLINT UNSIGNED,
    quantity TINYINT UNSIGNED,
    expiration_date DATE,
    FOREIGN KEY (store_id) REFERENCES store(store_id)
);

-- insert statement adjusted 
INSERT INTO inventory (store_id, quantity, ingredient_id, expiration_date)
VALUES (1, 10, 1, '2023-03-04');

CREATE TABLE ingredient (
	ingredient_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	inventory_id SMALLINT UNSIGNED,
    ingredient_name VARCHAR(30),
	FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id)
);

-- ingredient insert adjusted 
INSERT INTO ingredient (inventory_id, ingredient_name)
VALUES (1, 'Mango Smoothie Blend'),
(1, "Water");

-- Weak entity implementation for the many to many relataionship between ingredient and recipe
-- AKA many ingredients may be used for one recipe  	
CREATE TABLE recipe_ingredient (
	recipe_id TINYINT UNSIGNED,
	ingredient_id TINYINT UNSIGNED,
    ingredient_amount TINYINT UNSIGNED,
    PRIMARY KEY (recipe_id, ingredient_id),
	FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id),
	FOREIGN KEY (ingredient_id) REFERENCES ingredient(ingredient_id)
	);

insert into recipe_ingredient
values(1, 1, 2),
(1, 2, 1);

-- product table done
CREATE TABLE product (
	product_id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    inventory_id SMALLINT UNSIGNED,
	recipe_id TINYINT UNSIGNED,
    product_name VARCHAR(30),
    price DECIMAL(5, 2),
    FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id),
	FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id) 
);

-- insert statement adjusted
INSERT INTO product (inventory_id, recipe_id, product_name, price)
VALUES (1, NULL, 'Coffee Bean Hat', 9.99);


-- loyalty_member done
CREATE TABLE loyalty_member (
	member_id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	mem_first_name VARCHAR(15),
	mem_last_name VARCHAR(20),
    mem_email VARCHAR(35),
    mem_phone CHAR(10),
    mem_birthdate DATE,
    loyalty_credit SMALLINT UNSIGNED
);

-- insert adjusted
INSERT INTO loyalty_member (mem_first_name, mem_last_name, mem_email, mem_phone, mem_birthdate, loyalty_credit)
VALUES ('Johnny', 'Doeson', 'johndoe@mail.com', '1234567890', '1990-01-01', 100);


-- order_header done 
CREATE TABLE order_header (
	order_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    subtotal DECIMAL(6, 2),
    tax DECIMAL(3, 2),
    discount DECIMAL(6, 2),
	total DECIMAL(6,2),
    member_id SMALLINT UNSIGNED,
    FOREIGN KEY (member_id) REFERENCES loyalty_member(member_id)
);

-- insert adjusted 
INSERT INTO order_header (subtotal, tax, discount, total, member_id)
VALUES (9.45, 0.86, 0, 10.31, NULL);

-- does this need a composite primary key?
CREATE TABLE order_line (
	order_id INT UNSIGNED NOT NULL,
    product_id SMALLINT UNSIGNED NOT NULL,
    quantity TINYINT UNSIGNED,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES order_header(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

INSERT INTO order_line (order_id, product_id, quantity)
VALUES (1, 1, 5);
