SELECT 
    e.`employee_id`,
    CONCAT_WS(' ', e.`first_name`, e.`last_name`) AS `full_name`,
    d.`department_id`,
    d.`name` AS `department_name`
FROM
    `employees` e
        JOIN
    `departments` d ON e.`employee_id` = d.`manager_id`
ORDER BY e.`employee_id`
LIMIT 5;

SELECT 
    t.`town_id`, t.`name` AS `town_name`, a.`address_text`
FROM
    `towns` t
        JOIN
    `addresses` a ON t.`town_id` = a.`town_id`
WHERE
    t.`name` IN ('San Francisco' , 'Sofia', 'Carnation')
ORDER BY t.`town_id` , a.`address_id`;

SELECT 
    e.`employee_id`,
    e.`first_name`,
    e.`last_name`,
    e.`department_id`,
    e.`salary`
FROM
    `employees` e
WHERE
    e.`manager_id` IS NULL;

SELECT 
    COUNT(`salary`) AS count
FROM
    `employees`
WHERE
    `salary` > (SELECT 
            AVG(`salary`)
        FROM
            `employees`);

SELECT 
    e.`employee_id`,
    e.`job_title`,
    e.`address_id`,
    a.`address_text`
FROM
    `employees` e
        JOIN
    `addresses` a ON e.`address_id` = a.`address_id`
ORDER BY a.`address_id`
LIMIT 5; 

SELECT 
    e.`first_name`, e.`last_name`, `name` as 'town', `address_text`
FROM
    `employees` e
        JOIN
    `addresses` a ON e.`address_id` = a.`address_id`
        JOIN
    `towns` t ON a.`town_id` = t.`town_id`
ORDER BY `first_name` , `last_name`
LIMIT 5;

SELECT 
    e.`employee_id`,
    e.`first_name`,
    e.`last_name`,
    d.`name` AS 'department_name'
FROM
    `employees` e
        JOIN
    `departments` d ON e.`department_id` = d.`department_id`
WHERE
    d.`name` = 'Sales'
ORDER BY `employee_id` DESC;

SELECT 
    e.`employee_id`,
    e.`first_name`,
    e.`salary`,
    d.`name` AS 'department_name'
FROM
    `employees` e
        JOIN
    `departments` d ON e.`department_id` = d.`department_id`
WHERE
    `salary` > 15000
ORDER BY d.`department_id` DESC
LIMIT 5;

SELECT 
    e.`employee_id`, e.`first_name`
FROM
    `employees` e
        LEFT JOIN
    `employees_projects` p ON e.`employee_id` = p.`employee_id`
WHERE
    p.`project_id` IS NULL
ORDER BY e.`employee_id` DESC
LIMIT 3;
    
SELECT 
    e.`first_name`,
    e.`last_name`,
    e.`hire_date`,
    d.`name` AS 'dept_name'
FROM
    `employees` e
        JOIN
    `departments` d ON e.`department_id` = d.`department_id`
WHERE
    DATE(e.`hire_date`) > '1999-01-01'
        AND d.`name` IN ('Sales' , 'Finance')
ORDER BY `hire_date`;

SELECT 
    e.`employee_id`, e.`first_name`, p.`name` AS 'project_name'
FROM
    `employees` e
        JOIN
    `employees_projects` ep ON e.`employee_id` = ep.`employee_id`
        JOIN
    `projects` p ON ep.`project_id` = p.`project_id`
WHERE
    DATE
(p.`start_date`) > '200projects2-08-13'
        AND p.`end_date` IS NULL
ORDER BY e.`first_name` , p.`name`
LIMIT 5;

SELECT 
    e.`employee_id`,
    e.`first_name`,
    CASE
        WHEN DATE(p.`start_date`) >= '2005-01-01' THEN p.`name` = NULL
        ELSE p.`name`
    END AS 'project_name'
FROM
    `employees` e
        JOIN
    `employees_projects` ep ON e.`employee_id` = ep.`employee_id`
        JOIN
    `projects` p ON ep.`project_id` = p.`project_id`
WHERE
    e.`employee_id` = 24
ORDER BY p.`name`;

SELECT 
    e.`employee_id`,
    e.`first_name`,
    e.`manager_id`,
    (SELECT 
            `first_name`
        FROM
            `employees`
        WHERE
            `employee_id` = e.`manager_id`) AS `manager_name`
FROM
    `employees` e
    where e.`manager_id` IN (3,7)
    order by `first_name`;
    
SELECT 
    AVG(`salary`) AS 'min_average_salary'
FROM
    `employees`
GROUP BY `department_id`
ORDER BY `min_average_salary`
LIMIT 1;

SELECT 
    c.`country_name`, r.`river_name`
FROM
    `countries` c
        LEFT JOIN
    `countries_rivers` cr ON c.`country_code` = cr.`country_code`
        LEFT JOIN
    `rivers` r ON cr.`river_id` = r.`id`
WHERE
    `continent_code` = 'AF'
ORDER BY `country_name`
LIMIT 5;

SELECT 
    COUNT(s.`country_code`) AS country_count
FROM
    (SELECT 
        c.`country_code`
    FROM
        `countries` c
    LEFT JOIN `mountains_countries` mc ON c.`country_code` = mc.`country_code`
    WHERE
        mc.country_code IS NULL) s;

SELECT 
    c.`country_name`,
    MAX(p.`elevation`) AS 'highest_peak_elevation',
    MAX(r.`length`) AS 'longest_river_length'
FROM
    `countries` c
        JOIN
    `mountains_countries` mc ON mc.`country_code` = c.`country_code`
        JOIN
    `peaks` p ON p.`mountain_id` = mc.`mountain_id`
        JOIN
    `countries_rivers` cr ON cr.`country_code` = c.`country_code`
        JOIN
    `rivers` r ON r.`id` = cr.`river_id`
GROUP BY c.`country_name`
ORDER BY 'highest_peak_elevation' DESC , 'longest_river_length' DESC , c.`country_name`
LIMIT 5;