SELECT * FROM `departments`
ORDER BY `department_id`;

SELECT `name` FROM `departments`
ORDER BY `department_id`;

SELECT `first_name`, `last_name`, `salary` FROM `employees`;

SELECT `first_name`,`middle_name`, `last_name` FROM `employees`
ORDER BY `employee_id`;

SELECT CONCAT(CONCAT_WS(".",`first_name`,`last_name`),"@softuni.bg") 
AS `full_email_address`
FROM `employees`
ORDER BY `employee_id`;

SELECT DISTINCT `salary`
FROM `employees`
ORDER BY `salary`;

SELECT * FROM `employees`
WHERE `job_title` = "Sales Representative";

SELECT `first_name`, `last_name`, `job_title` FROM `employees`
WHERE `salary` BETWEEN 20000 AND 30000;

SELECT CONCAT_WS(" ",`first_name`,`middle_name` , `last_name`) AS "Full Name" FROM `employees`
WHERE `salary` IN (25000, 14000, 12500,23600);

SELECT `first_name`,`last_name` FROM `employees`
WHERE `manager_id` IS NULL;

SELECT `first_name`,`last_name`,`salary` FROM `employees`
WHERE `salary` > 50000
ORDER BY `salary` DESC;

SELECT `first_name`,`last_name` FROM `employees`
ORDER BY `salary` DESC
LIMIT 0, 5;

SELECT `first_name`,`last_name` FROM `employees`
WHERE `department_id` != 4;

SELECT * FROM `employees`
ORDER BY `salary` DESC, `first_name`, `last_name` DESC, `middle_name`;

CREATE VIEW `v_employees_salaries` AS
SELECT `first_name`,`last_name`,`salary` FROM `employees`;
SELECT * FROM `v_employees_salaries`;

CREATE VIEW `v_employees_job_titles` AS
SELECT CONCAT_WS(" ", `first_name`, `middle_name`,`last_name`) AS `full_name`,`job_title` FROM `employees`;
SELECT * FROM `v_employees_job_titles`;

SELECT DISTINCT `job_title` FROM `employees`;

SELECT * FROM `projects`
ORDER BY `start_date`, `name`, `project_id`
LIMIT 0,10;

SELECT `first_name`,`last_name`,`hire_date` FROM `employees`
ORDER BY `hire_date` DESC
LIMIT 0,7;

CREATE VIEW `salaries_of_Engineering_Tool_Design_Marketing` AS 
	SELECT `salary` FROM `employees`;

UPDATE `employees`
SET `salary` = `salary` * 1.12
WHERE `department_id` IN (1, 2, 4, 11);
SELECT * FROM `salaries_of_Engineering_Tool_Design_Marketing`;

SELECT `peak_name` FROM `peaks`
ORDER BY `peak_name`;

SELECT `country_name`, `population` FROM `countries`
WHERE `continent_code` = "EU"
ORDER BY `population` DESC, `country_name`
LIMIT 0,30;

SELECT `country_name`, `country_code`,
CASE
	WHEN `currency_code` != "EUR" THEN "Not Euro"
    ELSE "Euro"
END AS `currency_code`
FROM `countries`
ORDER BY`country_name`;

SELECT `name` FROM `characters`
ORDER BY `name`;