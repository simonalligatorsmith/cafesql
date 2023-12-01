-- Users
-- Admins have privileges to read and edit any table
CREATE USER 'Admin_1'@'localhost' IDENTIFIED BY 'Admin_1_password';
GRANT SELECT, INSERT, UPDATE, DELETE ON cafe.* TO 'Admin_1'@'localhost';

-- Managers have privileges to read anything, and edit all tables except store
CREATE USER 'Manager_1'@'localhost' IDENTIFIED BY 'Manager_1_password';
-- grant permissions on all tables except store. The concise version of this from the previous commit did not execute without errors
GRANT SELECT, INSERT, UPDATE, DELETE ON cafe.appliance TO 'Manager_1'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON cafe.employee TO 'Manager_1'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON cafe.ingredient   TO 'Manager_1'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON cafe.inventory   TO 'Manager_1'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON cafe.loyalty_member   TO 'Manager_1'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON cafe.order_header   TO 'Manager_1'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON cafe.order_line   TO 'Manager_1'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON cafe.product   TO 'Manager_1'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON cafe.recipe   TO 'Manager_1'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON cafe.recipe_appliance TO 'Manager_1'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON cafe.recipe_ingredient TO 'Manager_1'@'localhost';

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
GRANT SELECT ON cafe.loyalty_member TO 'Member_1'@'localhost';

FLUSH PRIVILEGES;

-- uncomment and run these lines to drop the sample users
/*
DROP USER 'Admin_1'@'localhost';
DROP USER 'Manager_1'@'localhost';
DROP USER 'Employee_1'@'localhost';
DROP USER 'Member_1'@'localhost';
*/
