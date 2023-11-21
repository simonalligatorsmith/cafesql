Drop database cafe;
CREATE DATABASE cafe;
USE cafe;

CREATE TABLE store (
    store_id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    store_phone CHAR(10),
    store_city VARCHAR(20),
    store_state CHAR(2)
);
	


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



CREATE TABLE appliance (
	appliance_id TINYINT UNSIGNED AUTO_INCREMENT,
    store_id SMALLINT UNSIGNED,
    appliance_type VARCHAR(20),
    warranty_date DATE,
    last_cleaned_date DATETIME,
    service_date DATE,
    PRIMARY KEY (appliance_id),
    FOREIGN KEY (store_id) REFERENCES store(store_id)
);



CREATE TABLE recipe (
	recipe_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    recipe_name VARCHAR(30),
    instruction VARCHAR(10000),
    is_drink BOOL
);




-- Weak entity table that establishes the many to many relationship of recipe and appliance
-- AKA many appliances can be used in many different recipes

-- NOTE: For recipe_appliance, I removed the foreign key "appliance_id" because it was for a physical appliance (store 2's blender) instead of an abstraction (a blender)
CREATE TABLE recipe_appliance (
	recipe_id TINYINT UNSIGNED,
	appliance_type VARCHAR(20),
    PRIMARY KEY (recipe_id, appliance_type),
	FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id)
	);



-- Changed this one so that inventory references ingredient, instead of the other way around. Ingredient is the abstraction that recipes use, and inventory has the actual items.
CREATE TABLE ingredient (
	ingredient_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ingredient_name VARCHAR(40)
);



-- For an ingredient in inventory
CREATE TABLE inventory (
    inventory_id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ingredient_id TINYINT UNSIGNED NOT NULL,
    store_id SMALLINT UNSIGNED,
    expiration_date DATE,
    FOREIGN KEY (store_id) REFERENCES store(store_id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredient(ingredient_id)
);



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
	
	


CREATE TABLE product (
	product_id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	recipe_id TINYINT UNSIGNED NOT NULL, 
    product_name VARCHAR(30),
    price DECIMAL(5, 2),
    FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id)
);



CREATE TABLE loyalty_member (
	member_id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	mem_first_name VARCHAR(15),
	mem_last_name VARCHAR(20),
    mem_email VARCHAR(35),
    mem_phone CHAR(10),
    mem_birthdate DATE,
    loyalty_credit SMALLINT UNSIGNED
);




CREATE TABLE order_header (
	order_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    subtotal DECIMAL(5, 2),
    tax DECIMAL(5, 2),
    discount DECIMAL(5, 2),
	total DECIMAL(5,2),
    member_id SMALLINT UNSIGNED,
	order_date DATETIME,
    FOREIGN KEY (member_id) REFERENCES loyalty_member(member_id)
);



-- does this need a composite primary key?
CREATE TABLE order_line (
	order_id INT UNSIGNED NOT NULL,
    product_id SMALLINT UNSIGNED NOT NULL,
    quantity TINYINT UNSIGNED CHECK (quantity > 0), 
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES order_header(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);
