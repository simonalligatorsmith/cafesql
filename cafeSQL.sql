CREATE DATABASE cafe;
USE cafe;

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
	emp_state CHAR(2)
	);

-- needs test insert
INSERT INTO employee (store_id, first_name, last_name, emp_birthdate, emp_email, emp_phone, start_date, emp_city, emp_state)
	VALUES(1, 'Sally', 'Davidson', '2001-03-02', 'saldavidson@hotmail.com', '8015672314', '2020-04-05', 'Provo', 'UT');

-- store table done, with data types adjusted	
CREATE TABLE store (
    store_id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    store_phone CHAR(10),
    store_city VARCHAR(20),
    store_state CHAR(2)
);

-- phone number adjusted
INSERT INTO store (store_phone, store_city, store_state)
VALUES ('8011234567', 'Provo', 'UT');

-- expiration date can be null, if we're putting non-food items in the inventory like soft good products 
-- inventory table up to date
CREATE TABLE inventory (
    inventory_id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    store_id SMALLINT UNSIGNED,
    quantity TINYINT UNSIGNED,
    expiration_date DATE,
    FOREIGN KEY (store_id) REFERENCES store(store_id)
);

-- insert statement adjusted 
INSERT INTO inventory (store_id, quantity, expiration_date)
VALUES (1, 50, '2023-03-04');

-- appliance table done 
CREATE TABLE appliance (
	appliance_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    store_id SMALLINT UNSIGNED,
    appliance_type VARCHAR(30),
    warranty_date DATE,
    last_cleaned_date DATETIME,
    service_date DATE,
    FOREIGN KEY (store_id) REFERENCES store(store_id)
);

-- appliance insert statement adjusted
INSERT INTO appliance (store_id, appliance_type, warranty_date, last_cleaned_date, service_date)
VALUES (1, 'Blender', '2025-06-30', '2023-11-02 12:30:30', '2023-12-15');

-- ingredient table done
CREATE TABLE ingredient (
	ingredient_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	inventory_id SMALLINT UNSIGNED,
    ingredient_name VARCHAR(30),
	FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id)
);

-- ingredient insert adjusted 
INSERT INTO ingredient (inventory_id, ingredient_name)
VALUES (1, 'Water');

-- recipe table done
CREATE TABLE recipe (
	recipe_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    recipe_name VARCHAR(50),
    amount TINYINT UNSIGNED,
    instruction VARCHAR(10000),
    is_drink BOOL
);

-- insert adjusted
INSERT INTO recipe (recipe_name, amount, instruction, is_drink)
VALUES ('Muffin', 12, 'Blah', 1);

-- composite primary key? 
CREATE TABLE recipe_appliance (
	recipe_id TINYINT UNSIGNED,
	appliance_id TINYINT UNSIGNED,
	FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id),
	FOREIGN KEY (appliance_id) REFERENCES appliance(appliance_id)
	);

-- composite primary key?  	
CREATE TABLE recipe_ingredient (
	recipe_id TINYINT UNSIGNED,
	ingredient_id TINYINT UNSIGNED,
    ingredient_amount TINYINT,
	FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id),
	FOREIGN KEY (ingredient_id) REFERENCES ingredient(ingredient_id)
	);

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
    order_date DATETIME,
    FOREIGN KEY (member_id) REFERENCES loyalty_member(member_id)
);

-- insert adjusted 
INSERT INTO order_header (subtotal, tax, discount, total, member_id, order_date)
VALUES (9.45, 0.86, 0, 10.31, NULL, '2023-11-16 12:30:00');

-- does this need a composite primary key?
CREATE TABLE order_line (
	order_id INT UNSIGNED,
    product_id SMALLINT UNSIGNED,
    quantity TINYINT UNSIGNED,
    FOREIGN KEY (order_id) REFERENCES order_header(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

INSERT INTO order_line (order_id, product_id, quantity)
VALUES (1, 1, 5);

-- ##########################################################################
-- Users

-- Admins have privileges to read and edit any table
CREATE USER 'Admin_1'@'localhost' IDENTIFIED BY 'admin_1_password';
GRANT SELECT, INSERT, UPDATE, DELETE ON cafe.* TO 'Admin_1'@'localhost';

-- Managers have privileges to read anything, and edit all tables except store
CREATE USER 'Manager_1'@'localhost' IDENTIFIED BY 'manager_1_password';
GRANT SELECT, INSERT, UPDATE, DELETE ON cafe.* TO 'Manager_1'@'localhost';
REVOKE INSERT, UPDATE, DELETE ON cafe.store FROM 'Manager_1'@'localhost';

-- Employee view privileges: appliance, recipe, ingredient, product
-- Employee edit privileges: inventory, order_line, order_header, loyalty_member
CREATE USER 'Employee_1'@'localhost' IDENTIFIED BY 'employee_1_password';
GRANT SELECT ON cafe.appliance TO 'Employee_1'@'localhost';
GRANT SELECT ON cafe.recipe TO 'Employee_1'@'localhost';
GRANT SELECT ON cafe.ingredient TO 'Employee_1'@'localhost';
GRANT SELECT ON cafe.product TO 'Employee_1'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON cafe.inventory TO 'Employee_1'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON cafe.order_line TO 'Employee_1'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON cafe.order_header TO 'Employee_1'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON cafe.loyalty_member TO 'Employee_1'@'localhost';

-- Members have privileges to read and edit the loyalty_members table only
CREATE USER 'Member_1'@'localhost' IDENTIFIED BY 'member_1_password';
GRANT SELECT, INSERT, UPDATE, DELETE ON cafe.loyalty_member TO 'Member_1'@'localhost';

FLUSH PRIVILEGES;

-- ##########################################################################
-- Queries

-- Display all the employees for all stores, and order them by their birthdays
SELECT employee_id, store_id, first_name, last_name, emp_birthdate
FROM employee
ORDER BY store_id ASC, MONTH(emp_birthdate), DAY(emp_birthdate);

-- Display all employees that started working before before the current year.
-- Group them by store, then order them by last name
SELECT employee_id, store_id, first_name, last_name, start_date
FROM employee
WHERE start_date < '2023-01-01'
ORDER BY store_id ASC, last_name ASC;

-- Displays all appliances that haven't been cleaned for more than a week
-- Also displays the total number of uncleaned appliances for each store
SELECT appliance_id, appliance_type, store_id, last_cleaned_date
FROM appliance
WHERE last_cleaned_date < DATE_SUB(CURRENT_DATE, INTERVAL 7 DAY);

-- Displays all appliances that have warranties expiring before next year
SELECT appliance_id, appliance_type, store_id, warranty_date
FROM appliance
WHERE YEAR(warranty_date) = YEAR(CURRENT_DATE);

-- Display all appliances needed for a specific recipe
SELECT DISTINCT a.appliance_type
FROM appliance a
JOIN recipe_appliance ra ON a.appliance_id = ra.appliance_id
JOIN recipe r ON ra.recipe_id = r.recipe_id
WHERE r.recipe_name = 'Muffin';

-- Display all recipes that require a specific appliance
SELECT r.recipe_name
FROM recipe r
JOIN recipe_appliance ra ON r.recipe_id = ra.recipe_id
JOIN appliance a ON ra.appliance_id = a.appliance_id
WHERE a.appliance_type = 'blender';

-- Display all needed ingredients and their required amount for a specific recipe
SELECT i.ingredient_name, ri.ingredient_amount
FROM recipe r
JOIN recipe_ingredient ri ON r.recipe_id = ri.recipe_id
JOIN ingredient i ON ri.ingredient_id = i.ingredient_id
WHERE r.recipe_name = 'Muffin';

-- Display all ingredient inventories that have passed their expiration date
SELECT i.store_id, i.inventory_id, ing.ingredient_name, i.quantity, i.expiration_date
FROM inventory i
JOIN ingredient ing ON i.inventory_id = ing.inventory_id
WHERE i.expiration_date < CURRENT_DATE
GROUP BY i.store_id, i.inventory_id, ing.ingredient_name, i.quantity, i.expiration_date
ORDER BY i.inventory_id;

-- Display the ingredient inventories of all sorted by alphabetical order
SELECT i.store_id, i.inventory_id, ing.ingredient_name, i.quantity, i.expiration_date
FROM inventory i
JOIN ingredient ing ON i.inventory_id = ing.inventory_id
GROUP BY i.store_id, i.inventory_id, ing.ingredient_name, i.quantity, i.expiration_date
ORDER BY ing.ingredient_name;

-- Display the total amount in sales from orders for the last 7 days
SELECT SUM(total) AS orders_total_last_7_days
FROM order_header
WHERE order_date >= CURDATE() - INTERVAL 7 DAY;

-- Display every order that included a specified product
SELECT ol.order_id, ol.quantity
FROM order_line ol
JOIN product p ON ol.product_id = p.product_id
JOIN order_header oh ON ol.order_id = oh.order_id
WHERE p.product_name = 'Muffin';

-- Display all orders with their total number of order_lines
SELECT oh.order_id, COUNT(ol.order_id) AS total_order_lines
FROM order_header oh
LEFT JOIN order_line ol ON oh.order_id = ol.order_id
GROUP BY oh.order_id;

-- Display all loyalty members and how much they've spent in orders
-- Members are sorted in descending order of how much they've spent
SELECT lm.member_id, lm.mem_first_name, lm.mem_last_name, SUM(oh.total) AS total_amount_spent
FROM loyalty_member lm
JOIN order_header oh ON lm.member_id = oh.member_id
GROUP BY lm.member_id, lm.mem_first_name, lm.mem_last_name
ORDER BY total_amount_spent DESC;
