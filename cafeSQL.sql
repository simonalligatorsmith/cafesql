CREATE DATABASE cafe;
USE cafe;

CREATE TABLE store (
    store_id INT AUTO_INCREMENT PRIMARY KEY,
    phone VARCHAR(20),
    city VARCHAR(50),
    state CHAR(2)
);

INSERT INTO store (phone, city, state)
VALUES ('(801)-123-4567', 'Provo', 'UT');

CREATE TABLE inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    store_id INT,
    quantity INT,
    ingredient_units VARCHAR(50),
    FOREIGN KEY (store_id) REFERENCES store(store_id)
);

INSERT INTO inventory (store_id, quantity, ingredient_units)
VALUES (1, 50, 'kilograms');

CREATE TABLE appliance (
	appliance_id INT AUTO_INCREMENT PRIMARY KEY,
    store_id INT,
    warranty_date DATE,
    last_cleaned_date DATE,
    service_date DATE,
    FOREIGN KEY (store_id) REFERENCES store(store_id)
);

INSERT INTO appliance (store_id, warranty_date, last_cleaned_date, service_date)
VALUES (1, '2025-06-30', '2023-11-02', '2023-12-15');

CREATE TABLE product (
	product_id INT AUTO_INCREMENT PRIMARY KEY,
    appliance_id INT,
    product_name VARCHAR(50),
    price DECIMAL(10, 2),
    FOREIGN KEY (appliance_id) REFERENCES appliance(appliance_id)
);

INSERT INTO product (appliance_id, product_name, price)
VALUES (1, 'Coffee', 4.99);

CREATE TABLE recipe (
	recipe_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
	-- Possible ingredient_id(s) foreign key
    amount INT,
    instructions VARCHAR(10000),
    is_drink BOOLEAN,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

INSERT INTO recipe (product_id, amount, instructions, is_drink)
VALUES (1, 12, 'Blah', true);

CREATE TABLE ingredient (
	ingredient_id INT AUTO_INCREMENT PRIMARY KEY,
    ingredient_name VARCHAR(50)
);

INSERT INTO ingredient (ingredient_name)
VALUES ('Water');

CREATE TABLE units (
	ingredient_id INT,
    unit_name VARCHAR(20),
    conversion VARCHAR(50),
    FOREIGN KEY (ingredient_id) REFERENCES ingredient(ingredient_id)
);

INSERT INTO units (ingredient_id, unit_name, conversion)
VALUES (1, 'Blah', 'Blah');

CREATE TABLE loyalty_member (
	member_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50),
    phone VARCHAR(20),
    birthday DATE,
    loyalty_credit INT
);

INSERT INTO loyalty_member (email, phone, birthday, loyalty_credit)
VALUES ('johndoe@mail.com', '123-456-7890', '1990-01-01', 100);

CREATE TABLE order_header (
	order_id INT AUTO_INCREMENT PRIMARY KEY,
    subtotal DECIMAL(10, 2),
    tax DECIMAL(10, 2),
    discount DECIMAL(10, 2),
    member_id INT NULL, -- optional
    FOREIGN KEY (member_id) REFERENCES loyalty_member(member_id)
);

INSERT INTO order_header (subtotal, tax, discount)
VALUES (9.45, 0.86, 0);

CREATE TABLE order_line (
	order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES order_header(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

INSERT INTO order_line (order_id, product_id, quantity)
VALUES (1, 1, 5);