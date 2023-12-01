-- NOTE: this is literally copy-and-pasted queries from Hunter's commit. I'm just splitting this into the three files - schema, data, and queries, so this one is the queries file. I have not tested extensively tested any of the queries in this fil. - S
-- Queries
-- //////////////////////////////////////////////////////////////////////////

-- Display all the employees for all stores, and order them by their birthdays
SELECT employee_id, store_id, first_name, last_name, emp_birthdate
FROM employee
ORDER BY store_id ASC, MONTH(emp_birthdate), DAY(emp_birthdate);

-- Display all employees that started working before the current year.
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
SELECT r.recipe_name, GROUP_CONCAT(ra.appliance_type) AS appliances
FROM recipe r
JOIN recipe_appliance ra ON r.recipe_id = ra.recipe_id
WHERE r.recipe_name = 'Avocado Toast'
GROUP BY r.recipe_name;

-- Display all recipes that require a specific appliance
SELECT r.recipe_id, r.recipe_name, r.amount
FROM recipe r
JOIN recipe_appliance ra ON r.recipe_id = ra.recipe_id
WHERE ra.appliance_type = 'Commercial Blender';

-- Display all needed ingredients and their required amount for a specific recipe
SELECT i.ingredient_name, ri.ingredient_amount
FROM recipe r
JOIN recipe_ingredient ri ON r.recipe_id = ri.recipe_id
JOIN ingredient i ON ri.ingredient_id = i.ingredient_id
WHERE r.recipe_name = 'Avocado Toast';

-- Display all ingredient inventories that have passed their expiration date
SELECT i.inventory_id, i.store_id, i.expiration_date, ig.ingredient_name
FROM inventory i
JOIN ingredient ig ON i.ingredient_id = ig.ingredient_id
WHERE i.expiration_date < CURRENT_DATE
ORDER BY i.store_id, i.inventory_id;

-- Display all ingredient inventories sorted in alphabetical order
SELECT i.inventory_id, i.store_id, i.expiration_date, ig.ingredient_name
FROM inventory i
JOIN ingredient ig ON i.ingredient_id = ig.ingredient_id
ORDER BY i.store_id, ig.ingredient_name;

-- Display the total amount in sales from orders for the last 7 days
SELECT SUM(total) AS orders_total_last_7_days
FROM order_header
WHERE order_date >= CURDATE() - INTERVAL 7 DAY;

-- Display every order that included a specified product
SELECT ol.order_id, ol.quantity
FROM order_line ol
JOIN product p ON ol.product_id = p.product_id
JOIN order_header oh ON ol.order_id = oh.order_id
WHERE p.product_name = 'Avocado Toast';

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
