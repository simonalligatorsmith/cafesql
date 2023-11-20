USE cafe;
	
INSERT INTO store (store_id,store_phone, store_city, store_state)
	VALUES
	(1,'8011234567', 'Provo',   'UT'),
	(2,'4443332222', 'Denver',  'CO'),
	(3,'5551112222', 'Chicago', 'IL'),
	(4,'2223334444', 'Boston',  'MA'),
	(5,'3332221111', 'Houston', 'TX');



INSERT INTO employee (store_id, first_name, last_name, emp_birthdate, emp_email, emp_phone, start_date, emp_city, emp_state)
	VALUES
	-- Employees from Provo, UT
	(1, 'Sally', 'Davidson', '2001-03-02', 'saldavidson@hotmail.com', '8015672314', '2020-04-05', 'Provo', 'UT'),
	(1, 'Emily', 'Johnson', '1985-08-22', 'emily.johnson@example.com', '8012345678', '2019-01-05', 'Provo', 'UT'),
	(1, 'Michael', 'Davis', '1993-03-10', 'michael.davis@example.com', '8013456789', '2021-04-18', 'Provo', 'UT'),
	(1, 'Sophia', 'Wilson', '1988-11-28', 'sophia.wilson@example.com', '8014567890', '2018-07-01', 'Provo', 'UT'),
	(1, 'Daniel', 'Miller', '1996-06-05', 'daniel.miller@example.com', '8015678901', '2022-09-15', 'Provo', 'UT'),
	(1, 'Olivia', 'Taylor', '1991-01-17', 'olivia.taylor@example.com', '8016789012', '2017-11-22', 'Provo', 'UT'),
	-- Employees from Chicago, IL
	(3, 'Ethan', 'Brown', '1987-09-03', 'ethan.brown@example.com', '3121234567', '2016-05-20', 'Chicago', 'IL'),
	(3, 'Grace', 'Lee', '1990-02-15', 'grace.lee@example.com', '3122345678', '2020-10-08', 'Chicago', 'IL'),
	(3, 'Liam', 'Anderson', '1995-07-28', 'liam.anderson@example.com', '3123456789', '2018-03-12', 'Chicago', 'IL'),
	(3, 'Megan', 'Martin', '1983-12-01', 'megan.martin@example.com', '3124567890', '2015-09-25', 'Chicago', 'IL'),
	(3, 'William', 'Smith', '1992-04-18', 'william.smith@example.com', '3125678901', '2019-12-30', 'Chicago', 'IL'),
	(3, 'Emma', 'Taylor', '1989-11-05', 'emma.taylor@example.com', '3126789012', '2017-02-14', 'Chicago', 'IL'),
	-- Employees from Houston, TX
	(5, 'Daniel', 'Johnson', '1980-06-12', 'daniel.johnson@example.com', '7131234567', '2014-08-03', 'Houston', 'TX'),
	(5, 'Sophie', 'Smith', '1986-03-25', 'sophie.smith@example.com', '7132345678', '2013-11-10', 'Houston', 'TX'),
	(5, 'Ryan', 'Miller', '1994-10-08', 'ryan.miller@example.com', '7133456789', '2022-01-18', 'Houston', 'TX'),
	(5, 'Olivia', 'Davis', '1982-05-20', 'olivia.davis@example.com', '7134567890', '2019-04-05', 'Houston', 'TX'),
	(5, 'Matthew', 'Anderson', '1997-01-03', 'matthew.anderson@example.com', '7135678901', '2016-06-22', 'Houston', 'TX'),
	(5, 'Emma', 'Brown', '1984-08-17', 'emma.brown@example.com', '7136789012', '2015-09-30', 'Houston', 'TX'),
	-- Employees from Denver, CO
	(2, 'Liam', 'Martin', '1988-02-28', 'liam.martin@example.com', '3031234567', '2018-11-15', 'Denver', 'CO'),
	(2, 'Grace', 'Lee', '1995-09-15', 'grace.lee@example.com', '3032345678', '2017-04-20', 'Denver', 'CO'),
	(2, 'Ethan', 'Wilson', '1991-04-02', 'ethan.wilson@example.com', '3033456789', '2022-08-03', 'Denver', 'CO'),
	(2, 'Sophia', 'Anderson', '1983-11-14', 'sophia.anderson@example.com', '3034567890', '2016-01-10', 'Denver', 'CO'),
	(2, 'Michael', 'Taylor', '1996-06-27', 'michael.taylor@example.com', '3035678901', '2019-03-28', 'Denver', 'CO'),
	(2, 'Ava', 'Martin', '1989-12-10', 'ava.martin@example.com', '3036789012', '2015-06-05', 'Denver', 'CO'),
	-- Employees from Boston, MA
	(4, 'Emma', 'Wilson', '1993-05-22', 'emma.wilson@example.com', '6171234567', '2016-08-18', 'Boston', 'MA'),
	(4, 'Ava', 'Taylor', '1985-12-05', 'ava.taylor@example.com', '6172345678', '2019-01-23', 'Boston', 'MA'),
	(4, 'Ethan', 'Smith', '1990-07-18', 'ethan.smith@example.com', '6173456789', '2017-04-30', 'Boston', 'MA'),
	(4, 'Mia', 'Brown', '1987-02-03', 'mia.brown@example.com', '6174567890', '2020-07-15', 'Boston', 'MA'),
	(4, 'William', 'Martin', '1996-09-10', 'william.martin@example.com', '6175678901', '2015-10-22', 'Boston', 'MA'),
	(4, 'Olivia', 'Davis', '1982-04-15', 'olivia.davis@example.com', '6176789012', '2018-02-08', 'Boston', 'MA');



INSERT INTO appliance (store_id, appliance_type, warranty_date, last_cleaned_date, service_date)
	VALUES
	(1, 'Espresso Machine', '2024-08-15', '2023-10-20 09:45:00', '2024-01-05'),
	(1, 'Coffee Grinder', '2023-12-31', '2023-11-12 15:20:00', '2023-12-20'),
	(1, 'Milk Frother', '2025-03-10', '2023-12-05 11:10:30', '2024-03-25'),
	(1, 'Cappuccino Maker', '2023-09-22', '2023-11-18 14:55:00', '2024-02-10'),
	(1, 'Tea Infuser', '2024-12-05', '2023-10-28 10:30:00', '2023-12-18'),
	(1, 'Commercial Blender', '2025-02-28', '2023-11-30 08:15:30', '2024-02-15'),
	(1, 'Juice Extractor', '2023-10-15', '2023-12-10 13:40:00', '2024-01-28'),
	(1, 'Drip Coffee Maker', '2024-04-18', '2023-12-20 16:25:00', '2024-05-10'),
	(1, 'Hot Water Kettle', '2023-11-15', '2023-11-05 09:10:00', '2024-01-22'),
	(1, 'Toaster Oven', '2023-07-10', '2023-10-15 12:50:30', '2024-01-02'),

	(2, 'Espresso Machine', '2024-08-15', '2023-10-20 09:45:00', '2024-01-05'),
	(2, 'Coffee Grinder', '2023-12-31', '2023-11-12 15:20:00', '2023-12-20'),
	(2, 'Milk Frother', '2025-03-10', '2023-12-05 11:10:30', '2024-03-25'),
	(2, 'Cappuccino Maker', '2023-09-22', '2023-11-18 14:55:00', '2024-02-10'),
	(2, 'Tea Infuser', '2024-12-05', '2023-10-28 10:30:00', '2023-12-18'),
	(2, 'Drip Coffee Maker', '2024-04-18', '2023-12-20 16:25:00', '2024-05-10'),
	(2, 'Hot Water Kettle', '2023-11-15', '2023-11-05 09:10:00', '2024-01-22'),
	(2, 'Toaster Oven', '2023-07-10', '2023-10-15 12:50:30', '2024-01-02'),
	
	(3, 'Espresso Machine', '2024-08-15', '2023-10-20 09:45:00', '2024-01-05'),
	(3, 'Coffee Grinder', '2023-12-31', '2023-11-12 15:20:00', '2023-12-20'),
	(3, 'Milk Frother', '2025-03-10', '2023-12-05 11:10:30', '2024-03-25'),
	(3, 'Cappuccino Maker', '2023-09-22', '2023-11-18 14:55:00', '2024-02-10'),
	(3, 'Tea Infuser', '2024-12-05', '2023-10-28 10:30:00', '2023-12-18'),
	(3, 'Commercial Blender', '2025-02-28', '2023-11-30 08:15:30', '2024-02-15'),
	(3, 'Juice Extractor', '2023-10-15', '2023-12-10 13:40:00', '2024-01-28'),
	(3, 'Drip Coffee Maker', '2024-04-18', '2023-12-20 16:25:00', '2024-05-10'),
	(3, 'Hot Water Kettle', '2023-11-15', '2023-11-05 09:10:00', '2024-01-22'),
	
	(4, 'Cappuccino Maker', '2023-09-22', '2023-11-18 14:55:00', '2024-02-10'),
	(4, 'Tea Infuser', '2024-12-05', '2023-10-28 10:30:00', '2023-12-18'),
	(4, 'Commercial Blender', '2025-02-28', '2023-11-30 08:15:30', '2024-02-15'),
	(4, 'Juice Extractor', '2023-10-15', '2023-12-10 13:40:00', '2024-01-28'),
	(4, 'Drip Coffee Maker', '2024-04-18', '2023-12-20 16:25:00', '2024-05-10'),
	(4, 'Hot Water Kettle', '2023-11-15', '2023-11-05 09:10:00', '2024-01-22'),
	(4, 'Toaster Oven', '2023-07-10', '2023-10-15 12:50:30', '2024-01-02'),
	
	(5, 'Espresso Machine', '2024-08-15', '2023-10-20 09:45:00', '2024-01-05'),
	(5, 'Coffee Grinder', '2023-12-31', '2023-11-12 15:20:00', '2023-12-20'),
	(5, 'Milk Frother', '2025-03-10', '2023-12-05 11:10:30', '2024-03-25'),
	(5, 'Cappuccino Maker', '2023-09-22', '2023-11-18 14:55:00', '2024-02-10'),
	(5, 'Tea Infuser', '2024-12-05', '2023-10-28 10:30:00', '2023-12-18'),
	(5, 'Hot Water Kettle', '2023-11-15', '2023-11-05 09:10:00', '2024-01-22'),
	(5, 'Toaster Oven', '2023-07-10', '2023-10-15 12:50:30', '2024-01-02');



INSERT INTO recipe (recipe_id,recipe_name, amount, instruction, is_drink)
	VALUES
	-- Drink recipes
	(1,'Mango Smoothie', 2, 'Blend Water and Mango Smoothie.', 1),
	(2,'Caramel Macchiato', 1, 'Brew strong espresso. Steam milk and add caramel syrup. Pour milk over espresso.', 1),
	(3,'Green Tea Lemonade', 1, 'Brew green tea and mix with freshly squeezed lemonade. Serve over ice.', 1),
	(4,'Iced Mocha', 1, 'Mix chocolate syrup with cold milk. Add espresso and ice. Stir well.', 1),
	(5,'Strawberry Banana Smoothie', 2, 'Blend together strawberries, banana, yogurt, and ice.', 1),
	(6,'Cinnamon Dolce Latte', 1, 'Brew espresso. Steam milk with cinnamon dolce syrup. Pour milk over espresso.', 1),
	(7,'Pineapple Coconut Smoothie', 2, 'Blend pineapple, coconut milk, and ice until smooth.', 1),
	(8,'Blueberry Lavender Lemonade', 1, 'Combine blueberries, lavender syrup, and freshly squeezed lemonade. Serve over ice.', 1),
	(9,'Hazelnut Hot Chocolate', 1, 'Heat milk and mix with hazelnut spread. Add cocoa powder and stir until smooth.', 1),

	-- Food recipes
	(10,'Avocado Toast', 2, 'Toast bread and spread mashed avocado on top. Sprinkle with salt and pepper.', 0),
	(11,'Caprese Salad', 1, 'Layer sliced tomatoes, fresh mozzarella, and basil leaves. Drizzle with balsamic glaze.', 0),
	(12,'Spinach and Feta Omelette', 3, 'Whisk eggs and pour into dish. Add spinach and feta. Bake in oven for two minutes.', 0),
	(13,'Quinoa Salad', 2, 'Cook quinoa and mix with diced vegetables, olive oil, and lemon juice.', 0),
	(14,'Vegetarian Tacos', 3, 'Fill taco shells with seasoned black beans, corn, lettuce, and salsa.', 0),
	(15,'Chocolate Chip Cookies', 24, 'Flatten cookie dough ball, and cook in oven for 5 minutes.', 0),
	(16,'Bucket of Cold Pasta Salad', 1, 'Take bucket from refrigerator and serve cold.', 0);



INSERT INTO recipe_appliance
	VALUES 		
		(1,'Commercial Blender'),
		(2,'Espresso Machine'),
		(2,'Milk Frother'),
		(3,'Tea Infuser'),
		(4,'Espresso Machine'),
		(5,'Commercial Blender'),
		(6,'Espresso Machine'),
		(6,'Milk Frother'),
		(7,'Commercial Blender'),
		(8,'Juice Extractor'),
		(9,'Hot Water Kettle'), 
		(10,'Milk Frother'),
		(11,'Toaster Oven'),
		(13,'Toaster Oven'),
		(15,'Toaster Oven'),
		(16,'Toaster Oven');



INSERT INTO ingredient (ingredient_id, ingredient_name)
	VALUES
	-- Drink ingredients
	(1, 'Mango Smoothie Mix Packet'),
	(2, 'Espresso Beans'),
	(3, 'Green Tea Bags'),
	(4, 'Chocolate Syrup'),
	(5, 'Strawberry Banana Smoothie Mix Packet'),
	(6, 'Cinnamon Dolce Syrup'),
	(7, 'Pineapple Coconut Smoothie Mix Packet'),
	(8, 'Blueberry Lavender Lemonade Mix'),
	(9, 'Hazelnut Hot Chocolate Mix'),

	-- Food ingredients
	(10, 'Avocado Spread'),
	(11, 'Fresh Mozzarella'),
	(12, 'Eggs'),
	(13, 'Quinoa'),
	(14, 'Black Beans (Canned)'),
	(15, 'Chocolate Chip Cookie Dough Balls'),
	(16, 'Bucket of Pasta Salad'),
	
	-- Additional ingredients for recipes
	(17, 'Caramel Syrup'),
	(18, 'Lemonade Mix'),
	(19, 'Milk'),
	(20, 'Yogurt'),
	(21, 'Fresh Basil'),
	(22, 'Coconut Milk'),
	(23, 'Blueberries'),
	(24, 'Lavender Syrup'),
	(25, 'Hazelnut Spread'),
	(26, 'Bread'),
	(30, 'Taco Shells');
    
    

INSERT INTO inventory (ingredient_id, store_id, expiration_date)
	VALUES 
	(2, 3, '2023-11-17'),
	(1, 1, '2023-10-15'),
	(3, 2, '2023-12-05'),
	(4, 1, '2024-01-20'),
	(2, 4, '2023-11-30'),
	(5, 3, '2023-10-25'),
	(1, 5, '2023-11-10'),
	(3, 4, '2023-12-15'),
	(4, 2, '2024-02-08'),
	(2, 5, '2023-12-01'),
	(5, 1, '2023-10-31');



INSERT INTO recipe_ingredient (recipe_id, ingredient_id, ingredient_amount)
	VALUES
	-- Mango Smoothie
	(1, 1, 1), -- Mango Smoothie Mix Packet

	-- Caramel Macchiato
	(2, 2, 1), -- Espresso Beans
	(2, 19, 1), -- Milk

	-- Green Tea Lemonade
	(3, 3, 1), -- Green Tea Bags
	(3, 18, 1), -- Lemonade Mix

	-- Iced Mocha
	(4, 2, 1), -- Espresso Beans
	(4, 4, 1), -- Chocolate Syrup
	(4, 19, 1), -- Milk

	-- Strawberry Banana Smoothie
	(5, 5, 1), -- Strawberry Banana Smoothie Mix Packet

	-- Cinnamon Dolce Latte
	(6, 2, 1), -- Espresso Beans
	(6, 6, 1), -- Cinnamon Dolce Syrup
	(6, 19, 1), -- Milk

	-- Pineapple Coconut Smoothie
	(7, 7, 1), -- Pineapple Coconut Smoothie Mix Packet

	-- Blueberry Lavender Lemonade
	(8, 8, 1), -- Blueberry Lavender Lemonade Mix
	(8, 23, 0.5), -- Blueberries

	-- Hazelnut Hot Chocolate
	(9, 9, 1), -- Hazelnut Hot Chocolate Mix
	(9, 25, 1), -- Hazelnut Spread

	-- Avocado Toast
	(10, 10, 1), -- Avocado Spread
	(10, 26, 2), -- Bread

	-- Caprese Salad
	(11, 11, 1), -- Fresh Mozzarella

	-- Spinach and Feta Omelette
	(12, 12, 3), -- Eggs

	-- Quinoa Salad
	(13, 13, 2), -- Quinoa

	-- Vegetarian Tacos
	(14, 14, 3), -- Black Beans (Canned)

	-- Chocolate Chip Cookies
	(15, 15, 24), -- Chocolate Chip Cookie Dough Balls

	-- Bucket of Cold Pasta Salad
	(16, 16, 1); -- Bucket of Pasta Salad 
	
	

-- insert statement adjusted
INSERT INTO product (recipe_id, product_name, price)
	VALUES
	-- Drinks
	(1,'Mango Smoothie', 5.99),
	(2,'Caramel Macchiato', 4.99),
	(3,'Green Tea Lemonade', 3.99),
	(4,'Iced Mocha', 4.99),
	(5,'Strawberry Banana Smoothie', 5.99),
	(6,'Cinnamon Dolce Latte', 4.99),
	(7,'Pineapple Coconut Smoothie', 5.99),
	(8,'Blueberry Lavender Lemonade', 4.99),
	(9,'Hazelnut Hot Chocolate', 3.99),
	
	-- Foods
	(10,'Avocado Toast', 6.99),
	(11,'Caprese Salad', 5.99),
	(12,'Spinach and Feta Omelette', 4.99),
	(13,'Quinoa Salad', 6.99),
	(14,'Vegetarian Tacos', 3.99),
	(15,'Chocolate Chip Cookies', 1.99),
	(16,'Bucket of Cold Pasta Salad', 19.99);



INSERT INTO loyalty_member (member_id, mem_first_name, mem_last_name, mem_email, mem_phone, mem_birthdate, loyalty_credit)
	VALUES 
	(1,'Johnny', 'Doeson', 'johndoe@mail.com', '1234567890', '1990-01-01', 100),
	(2,'Marton', 'Kovacs', 'marton@mail.com', '9876543210', '1985-05-15', 50),
	(3,'Agnieszka', 'Nowak', 'agnieszka@mail.com', '5556667777', '1992-09-20', 75),
	(4,'Andrei', 'Popescu', 'andrei@mail.com', '4443332222', '1988-03-10', 120),
	(5,'Zsuzsanna', 'Nagy', 'zsuzsanna@mail.com', '1112223333', '1977-11-28', 90),
	(6,'Piotr', 'Kowalski', 'piotr@mail.com', '9998887777', '1995-07-03', 60),
	(7,'Elena', 'Ionescu', 'elena@mail.com', '3334445555', '1983-12-12', 80),
	(8,'Gabor', 'Fekete', 'gabor@mail.com', '7778889999', '1980-06-18', 110), 
	(9,'Katarzyna', 'Wojcik', 'katarzyna@mail.com', '6665554444', '1998-04-25', 95),
	(10,'Vlad', 'Dumitru', 'vlad@mail.com', '2223334444', '1982-08-08', 70),
	(11,'Attila', 'Varga', 'attila@mail.com', '8889990000', '1996-09-05', 85),
	(12,'Aleksandra', 'Zajac', 'aleksandra@mail.com', '1231231234', '1993-02-15', 130),
	(13,'Dragos', 'Cozma', 'dragos@mail.com', '4564564567', '1975-10-30', 110),
	(14,'Zoltan', 'Molnar', 'zoltan@mail.com', '7897897890', '1991-06-22', 75),
	(15,'Patryk', 'Lewandowski', 'patryk@mail.com', '2342342345', '1986-04-03', 100),
	(16,'Irina', 'Dumitrache', 'irina@mail.com', '3453453456', '1978-09-14', 120),
	(17,'Bela', 'Kiss', 'bela@mail.com', '5675675678', '1997-12-01', 90),
	(18,'Aneta', 'Sikora', 'aneta@mail.com', '8768768765', '1981-01-08', 50),
	(19,'Alexandru', 'Enescu', 'alexandru@mail.com', '6546546543', '1989-07-12', 65),
	(20,'Mihaly', 'Papp', 'mihaly@mail.com', '9879879876', '1994-11-19', 110);



INSERT INTO order_header (subtotal, tax, discount, total, member_id)
	VALUES 
	(50.00, 5.00, 10.00, 45.00, 1),
	(75.50, 7.00, 15.75, 66.75, 2),
	(120.00, 10.50, 20.00, 109.50, 3),
	(30.25, 3.50, 5.25, 28.50, 4),
	(90.00, 8.00, 18.00, 80.00, 5);



INSERT INTO order_line (order_id, product_id, quantity)
	VALUES 
	(1, 2, 3),
    (1, 1, 5),
	(1, 3, 2),
	(1, 4, 4),
	(1, 5, 1),
	(1, 6, 2),
	(1, 7, 3),
	(1, 8, 1),
	(1, 9, 4),
	(1, 10, 2),
	(1, 11, 3),
	(2, 1, 2),
	(2, 3, 1),
	(2, 5, 3),
	(2, 7, 2),
	(2, 9, 4),
	(2, 11, 1),
	(2, 13, 3),
	(3, 2, 4),
	(3, 4, 2),
	(3, 6, 1),
	(3, 8, 3),
	(3, 10, 2),
	(3, 12, 4),
	(3, 14, 1),
	(3, 16, 3),
	(4, 1, 2),
	(4, 3, 1),
	(4, 5, 3),
	(4, 7, 2),
	(4, 9, 4),
	(4, 11, 1),
	(4, 13, 3),
	(5, 2, 4),
	(5, 4, 2),
	(5, 6, 1),
	(5, 8, 3),
	(5, 10, 2),
	(5, 12, 4),
	(5, 14, 1),
	(5, 16, 3);

-- end all
