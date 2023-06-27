CREATE TABLE `mountains` (
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL
);

CREATE TABLE `peaks` (
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL,
`mountain_id` INT,
CONSTRAINT `FK_peaks_mountains` 
FOREIGN KEY (`mountain_id`) REFERENCES `mountains`(`id`)
);

INSERT INTO `mountains`(`name`)
VALUES ("Rodopi"),("Pirin");

INSERT INTO `peaks`(`mountain_id`, `name`)
VALUES (1, "Голям Перелик"), (1, "Карлъка");

INSERT INTO `peaks`(`mountain_id`, `name`)
VALUES (2, "Вихрен"), (2, "Кутело");

ALTER TABLE `camp`.`peaks` 
DROP CONSTRAINT `FK_MountainsPeaks`;

ALTER TABLE `peaks`
ADD CONSTRAINT `FK_peaks_mountains`
FOREIGN KEY (`mountain_id`) REFERENCES `mountains`(`id`);

ALTER TABLE `camp`.`peaks` 
DROP CONSTRAINT `FK_peaks_mountains`;

ALTER TABLE `peaks`
ADD CONSTRAINT `FK_peaks_mountains`
FOREIGN KEY (`mountain_id`) REFERENCES `mountains`(`id`)
ON DELETE CASCADE;

DELETE FROM `mountains`
WHERE `name` = "Pirin";

SELECT `driver_id`, `vehicle_type`, CONCAT(`first_name`," ", `last_name`) AS `driver_name`
FROM `vehicles` AS v
JOIN `campers` AS c ON v.`driver_id` = c.`id`;

SELECT `starting_point` AS 'route_starting_point', `end_point` AS 'route_starting_point', `leader_id`, CONCAT(`first_name`," ", `last_name`)
FROM `routes` AS r
JOIN `campers` AS c ON r.`leader_id` = c.`id`;

CREATE TABLE `people` (
`person_id` INT PRIMARY KEY AUTO_INCREMENT,
`first_name` VARCHAR(50) NOT NULL,
`salary` DOUBLE NOT NULL,
`passport_id` INT NOT NULL,
CONSTRAINT `FK_passport_people`
FOREIGN KEY (`passport_id`) REFERENCES `passports`(`passport_id`)
);

CREATE TABLE `passport` (
`passport_id` INT PRIMARY KEY AUTO_INCREMENT,
`passport_number` VARCHAR(50)
);

INSERT INTO `people`(`first_name`,`salary`,`passport_id`)
VALUES ("Roberto", 43300.01, 102), ("Tom", 56100.00, 103), ("Yana", 56100.00, 101);

ALTER TABLE `passport`
RENAME `passports`;

INSERT INTO `passports`(`passport_number`)
VALUES ("N34FG21B"), ("K65LO4R7"), ("ZE657QP2");

INSERT INTO `people`(`first_name`,`salary`,`passport_id`)
VALUES ("Ivan", 53300.01, 104);

CREATE TABLE `manufacturers` (
`manufacturer_id` INT,
`name` VARCHAR(50) NOT NULL,
`established_on` DATE
);

CREATE TABLE `models` (
`model_id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL,
`manufacturer_id` INT NOT NULL
);

ALTER TABLE `manufacturers` 
ADD PRIMARY KEY (`manufacturer_id`);

ALTER TABLE `manufacturers`
MODIFY COLUMN `manufacturer_id` INT AUTO_INCREMENT;

ALTER TABLE `models`
ADD CONSTRAINT `FK_manufacturers_models`
FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers`(`manufacturer_id`);

INSERT INTO `manufacturers`(`name`, `established_on`)
VALUES ("BMW", "1916-03-01"), ("Tesla", "2003-01-01"), ("Lada", "1966-05-01");

ALTER TABLE `models`AUTO_INCREMENT = 101;

INSERT INTO `models` (`name`, `manufacturer_id`)
VALUES ("X1",1),("i6",1),("Model S",2),("Model X",2),("Model 3",2),("Nova",3); 

CREATE TABLE `students`(
`student_id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(45)
);

CREATE TABLE `exams`(
`exam_id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(45)
);

CREATE TABLE `students_exams`(
`student_id` INT NOT NULL,
`exam_id` INT NOT NULL
);

ALTER TABLE `students_exams`
ADD CONSTRAINT FK_students_studentsExams
FOREIGN KEY (`student_id`) REFERENCES `students`(`student_id`),
ADD CONSTRAINT FK_exams_studentsExams
FOREIGN KEY (`exam_id`) REFERENCES `exams`(`exam_id`);

INSERT INTO `students` (`student_id`, `name`) 
VALUES 
    (1, 'Mila'), 
    (2, 'Toni'), 
    (3, 'Ron');
    
INSERT INTO `exams` (`exam_id`, `name`) 
VALUES 
    (101, 'Spring MVC'), 
    (102, 'Neo4j'), 
    (103, 'Oracle 11g');

INSERT INTO `students_exams` (`student_id`, `exam_id`) 
VALUES 
    (1, 101),
    (1, 102),
    (2, 101),
    (3, 103),
    (2, 102),
    (2, 103);
    
    SELECT s.`name`, e.`name`
    FROM `students_exams` se
    JOIN `students` s ON se.`student_id` = s.`student_id`
    JOIN `exams` e ON se.`exam_id` = e.`exam_id`;
    
    CREATE TABLE `item_types` (
    `item_type_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL
    );
    
    CREATE TABLE `items` (
    `item_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL UNIQUE,
    `item_type_id` INT NOT NULL,
    CONSTRAINT FK_items_itemsType
    FOREIGN KEY (`item_type_id`) REFERENCES `item_types`(`item_type_id`)
    );
    
	CREATE TABLE `cities` (
    `city_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL UNIQUE
    );
    
    CREATE TABLE `customers` (
    `customer_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `birthday` DATE,
    `city_id` INT NOT NULL,
    CONSTRAINT FK_customers_cities
    FOREIGN KEY (`city_id`) REFERENCES `cities`(`city_id`)
    );
    
    CREATE TABLE `orders` (
    `order_id` INT PRIMARY KEY AUTO_INCREMENT,
    `customer_id` INT NOT NULL,
    CONSTRAINT FK_orders_customers
    FOREIGN KEY (`customer_id`) REFERENCES `customers`(`customer_id`)
    );
    
    CREATE TABLE `order_items` (
    `order_id` INT NOT NULL,
    `item_id` INT NOT NULL,
    CONSTRAINT pk
    PRIMARY KEY(`order_id`, `item_id`),
    CONSTRAINT FK_orderItems_orders
    FOREIGN KEY (`order_id`) REFERENCES `orders`(`order_id`),
    CONSTRAINT FK_orderItems_items
    FOREIGN KEY (`item_id`) REFERENCES `items`(`item_id`)
    );

SELECT m.`mountain_range`, p.`peak_name`, p.`elevation` AS 'peak_elevation'
FROM `mountains` m
JOIN `peaks` p ON m.`id` = p.`mountain_id`
WHERE m.`mountain_range` = "Rila"
ORDER BY `elevation` DESC;