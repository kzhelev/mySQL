USE `soft_uni`;
SELECT `first_name`,`last_name` FROM `employees`
WHERE LOWER(`first_name`) LIKE "sa%";

SELECT `first_name`,`last_name` FROM `employees`
WHERE LOWER(`last_name`) LIKE "%ei%";

/* same function, different implementation */
SELECT `first_name`,`last_name` FROM `employees`
WHERE LOCATE("ei", LOWER(`last_name`)) != 0;

SELECT `first_name` FROM `employees`
WHERE `department_id` IN (3,10) AND YEAR(`hire_date`) BETWEEN 1995 AND 2005
ORDER BY `employee_id`;

SELECT `first_name`,`last_name` FROM `employees`
WHERE LOCATE("engineer", LOWER(`job_title`)) = 0;

SELECT `name` FROM `towns`
WHERE CHAR_LENGTH(`name`) IN (5,6)
ORDER BY `name`;

SELECT `town_id`, `name` FROM `towns`
WHERE SUBSTRING(`name`,1,1) IN ("m","k","b","e")
ORDER BY `name`;

SELECT `town_id`, `name` FROM `towns`
WHERE SUBSTRING(`name`,1,1) NOT IN ("r","b","d")
ORDER BY `name`;

CREATE VIEW `v_employees_hired_after_2000` AS
	SELECT `first_name`, `last_name` FROM `employees`
    WHERE YEAR(`hire_date`) > 2000;
    
SELECT * FROM `v_employees_hired_after_2000`;

SELECT `first_name`, `last_name` FROM `employees`
WHERE CHAR_LENGTH(`last_name`) = 5;

USE `geography`;
SELECT `country_name`, `iso_code` FROM `countries`
WHERE char_length(`country_name`) - char_length(REPLACE(LOWER(`country_name`), "a","")) >= 3
ORDER BY `iso_code`;

SELECT `peak_name` ,`river_name`, LOWER(CONCAT(`peak_name`,SUBSTRING(`river_name`,2))) AS `mix`
FROM `peaks`, `rivers`
WHERE SUBSTRING(`river_name`,1,1) = SUBSTRING(`peak_name`,-1,1)
ORDER BY `mix`;

USE `diablo`;
SELECT `name`, DATE_FORMAT(`start`, "%Y-%m-%d") AS `start`
FROM `games`
WHERE YEAR(`start`) BETWEEN 2011 AND 2012
ORDER BY `start`,`name` DESC
LIMIT 50;

SELECT `user_name`, SUBSTRING(`email`, LOCATE("@",`email`)+1) AS `email provider` FROM `users`
ORDER BY `email provider`, `user_name`;

SELECT `user_name`, `ip_address` FROM `users`
WHERE `ip_address` LIKE("___.1%.%.___")
ORDER BY `user_name`;

SELECT `name` AS `game`, 
CASE
WHEN HOUR(`start`) >= 0 AND HOUR(`start`) < 12 THEN "Morning"
WHEN HOUR(`start`) >= 12 AND HOUR(`start`) < 18 THEN "Afternoon"
WHEN HOUR(`start`) >= 18 AND HOUR(`start`) < 24 THEN "Evening"
END
AS `Part of the Day`,
CASE
WHEN `duration` <= 3 THEN "Extra Short"
WHEN `duration` > 3 AND `duration` <= 6  THEN "Short"
WHEN `duration` > 6 AND `duration` <= 10  THEN "Long"
ELSE "Extra Long"
END
AS `Duration`
FROM `games`;

USE `orders`;
SELECT `product_name`,`order_date`,ADDDATE(`order_date`, INTERVAL 3 DAY) AS `pay_due`,ADDDATE(`order_date`, INTERVAL 1 MONTH) AS `deliver_due`
FROM `orders`;
