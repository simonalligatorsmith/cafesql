DROP SCHEMA IF EXISTS cafe;
CREATE DATABASE cafe;
USE cafe;

CREATE TABLE store (
    store_id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    store_phone CHAR(10),
    store_city VARCHAR(20) NOT NULL,
    store_state CHAR(2) NOT NULL
);
	

CREATE TABLE employee (
	employee_id MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	store_id SMALLINT UNSIGNED NOT NULL,
	first_name VARCHAR(15) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	emp_birthdate DATE NOT NULL,
	emp_email VARCHAR(35),
	emp_phone CHAR(10) NOT NULL,
	start_date DATE,
	emp_city VARCHAR(20),
	emp_state CHAR(2),
    emp_is_over_14 BOOL DEFAULT (TIMESTAMPDIFF(YEAR, emp_birthdate, NOW()) >= 14), -- no employees younger than 14, this is now you tell
    foreign key (store_id) references store(store_id) 
		ON UPDATE CASCADE -- update store_id if the store's store_id changes
        ON DELETE RESTRICT -- can't delete store until all employees are deleted or reassigned
);



CREATE TABLE appliance (
	appliance_id TINYINT UNSIGNED AUTO_INCREMENT,
    store_id SMALLINT UNSIGNED NOT NULL,
    appliance_type VARCHAR(20),
    warranty_date DATE,
    last_cleaned_date DATETIME,
    service_date DATE,
    PRIMARY KEY (appliance_id),
    FOREIGN KEY (store_id) REFERENCES store(store_id)
		ON UPDATE CASCADE -- update store_id if the store's store_id changes 
        ON DELETE RESTRICT -- this prevents an appliance from being unassigned to a store
);



CREATE TABLE recipe (
	recipe_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    recipe_name VARCHAR(30),
    amount TINYINT UNSIGNED,
    instruction VARCHAR(10000),
    is_drink BOOL NOT NULL
);




-- Weak entity table that establishes the many to many relationship of recipe and appliance
-- AKA many appliances can be used in many different recipes

-- NOTE: For recipe_appliance, I removed the foreign key "appliance_id" because it was for a physical appliance (store 2's blender) instead of an abstraction (a blender)
CREATE TABLE recipe_appliance (
	recipe_id TINYINT UNSIGNED,
	appliance_type VARCHAR(20),
    PRIMARY KEY (recipe_id, appliance_type),
	FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id)
		ON UPDATE CASCADE -- if recipe_id is changed, reflect that change here
		ON DELETE CASCADE -- if recipe is deleted, no need to save recipe_appliance relationship
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
    FOREIGN KEY (store_id) REFERENCES store(store_id)
		ON UPDATE CASCADE -- update store_id if the store's store_id changes 
        ON DELETE RESTRICT, -- this prevents an inventory item from being unassigned to a store
    FOREIGN KEY (ingredient_id) REFERENCES ingredient(ingredient_id)
		ON UPDATE CASCADE -- if something changes about the ingredient_id, reflect changes in inventory
        ON DELETE RESTRICT -- if the ingredient is removed from the list while there's inventory of the ingredient, complain
);



-- Weak entity implementation for the many to many relataionship between ingredient and recipe
-- AKA many ingredients may be used for one recipe  	
CREATE TABLE recipe_ingredient (
	recipe_id TINYINT UNSIGNED NOT NULL,
	ingredient_id TINYINT UNSIGNED NOT NULL,
    ingredient_amount TINYINT UNSIGNED,
    PRIMARY KEY (recipe_id, ingredient_id),
	FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id)
		ON UPDATE CASCADE -- if changes to recipe_id are made, reflect that here
        ON DELETE CASCADE, -- if the recipe is deleted, this list of its ingredients can also be deleted
	FOREIGN KEY (ingredient_id) REFERENCES ingredient(ingredient_id)
		ON UPDATE CASCADE -- if ingredient_id changes for whatever reason, reflect that change here
        ON DELETE RESTRICT -- complain if an ingredient is deleted, but the recipe_ingredient still references it
	);
	
	


CREATE TABLE product (
	product_id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	recipe_id TINYINT UNSIGNED NOT NULL, 
    product_name VARCHAR(30),
    price DECIMAL(5, 2) CHECK (price>=0), -- business rule: price can't be negative
    FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id)
		ON UPDATE CASCADE -- if recipe_id changes, reflect that here
		ON DELETE RESTRICT -- we don't want to have a phantom product with no recipe to make it
);


-- per business rule, none of their identifying fields (name, email, etc) can be null.
CREATE TABLE loyalty_member (
	member_id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	mem_first_name VARCHAR(15) NOT NULL,
	mem_last_name VARCHAR(20) NOT NULL,
    mem_email VARCHAR(35) NOT NULL,
    mem_phone CHAR(10) NOT NULL,
    mem_birthdate DATE NOT NULL,
    loyalty_credit SMALLINT UNSIGNED
);




CREATE TABLE order_header (
	order_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    subtotal DECIMAL(5, 2) NOT NULL,
    tax DECIMAL(5, 2) NOT NULL,
    discount DECIMAL(5, 2),
	total DECIMAL(5,2) NOT NULL CHECK(total >= 0), -- business rule: total can't be negative
    member_id SMALLINT UNSIGNED,
	order_date DATETIME NOT NULL,
    FOREIGN KEY (member_id) REFERENCES loyalty_member(member_id)
		ON UPDATE CASCADE -- if loyalty member changes, ok to reflect that here
        ON DELETE SET NULL -- if loyalty member deleted, ok to set member_id to NULL for previous orders
);



-- does this need a composite primary key?
CREATE TABLE order_line (
	order_id INT UNSIGNED NOT NULL,
    product_id SMALLINT UNSIGNED NOT NULL,
    quantity TINYINT UNSIGNED CHECK (quantity > 0), 
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES order_header(order_id)
		ON UPDATE CASCADE
        ON DELETE CASCADE, -- if deleting order_header, delete order_lines as well
    FOREIGN KEY (product_id) REFERENCES product(product_id)
		ON UPDATE CASCADE
        ON DELETE RESTRICT -- don't delete the product if there are order_lines that reference it
);
