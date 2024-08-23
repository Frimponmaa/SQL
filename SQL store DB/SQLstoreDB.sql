-- sql_store
DROP DATABASE IF EXISTS `sql_invoicing`; -- Delete sql_invoicing database if is exists already.

CREATE DATABASE `sql_invoicing`;  -- Create a new database called sql_invoicing

USE `sql_invoicing`; -- Sets the current database to work with as sql_invoicing

SET NAMES utf8 ; -- Ensures that text data is properly encoded and interpreted
SET character_set_client = utf8mb4 ;  -- Ensures that characters are properly encoded and interpreted

-- Create the `payment_methods` table
CREATE TABLE `payment_methods` (
  -- Define the `payment_method_id` column as a tiny integer with auto-increment. payment_id cannot have null values
  `payment_method_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  -- Define the `name` column as a variable character with a maximum length of 50 characters. name cannot  have null values
  `name` varchar(50) NOT NULL,
  -- Set the `payment_method_id` column as the primary key for the table
  PRIMARY KEY (`payment_method_id`)
) 
-- Specify the storage engine to use InnoDB
ENGINE=InnoDB 
-- Set the auto-increment starting value to 5
AUTO_INCREMENT=5 
-- Set the default character set to UTF-8MB4 for supporting multi-byte characters
DEFAULT CHARSET=utf8mb4 
-- Set the default collation to utf8mb4_0900_ai_ci for case-insensitive comparison
COLLATE=utf8mb4_0900_ai_ci;

-- Insert data into the payment_method table
INSERT INTO `payment_methods` VALUES (1,'Credit Card');
INSERT INTO `payment_methods` VALUES (2,'Cash');
INSERT INTO `payment_methods` VALUES (3,'PayPal');
INSERT INTO `payment_methods` VALUES (4,'Wire Transfer');

-- Create the `clients` table
CREATE TABLE `clients` (
  -- Define the `client_id` column as an integer with a maximum length of 11 digits. client_id cannot have null values
  `client_id` int(11) NOT NULL,
  -- Define the `name` column as a variable character with a maximum length of 50 characters. name cannot have null values
  `name` varchar(50) NOT NULL,
  -- Define the `address` column as a variable character with a maximum length of 50 characters. address cannot have null values
  `address` varchar(50) NOT NULL,
  -- Define the `city` column as a variable character with a maximum length of 50 characters. city cannot have null values
  `city` varchar(50) NOT NULL,
  -- Define the `state` column as a fixed-length character with a length of 2 characters. state cannot have null values
  `state` char(2) NOT NULL,
  -- Define the `phone` column as a variable character with a maximum length of 50 characters, allowing NULL values. phone can have null values
  `phone` varchar(50) DEFAULT NULL,
  -- Set the `client_id` column as the primary key for the table
  PRIMARY KEY (`client_id`)
) 
-- Specify the storage engine to use InnoDB
ENGINE=InnoDB 
-- Set the default character set to UTF-8MB4 for supporting multi-byte characters
DEFAULT CHARSET=utf8mb4 
-- Set the default collation to utf8mb4_0900_ai_ci for case-insensitive comparison
COLLATE=utf8mb4_0900_ai_ci;

-- Insert data into the clients table
INSERT INTO `clients` VALUES (1,'Vinte','3 Nevada Parkway','Syracuse','NY','315-252-7305');
INSERT INTO `clients` VALUES (2,'Myworks','34267 Glendale Parkway','Huntington','WV','304-659-1170');
INSERT INTO `clients` VALUES (3,'Yadel','096 Pawling Parkway','San Francisco','CA','415-144-6037');
INSERT INTO `clients` VALUES (4,'Kwideo','81674 Westerfield Circle','Waco','TX','254-750-0784');
INSERT INTO `clients` VALUES (5,'Topiclounge','0863 Farmco Road','Portland','OR','971-888-9129');
-- Select * from `clients` ;

-- Create the `invoices` table
CREATE TABLE `invoices` (
  -- Define the `invoice_id` column as an integer with a maximum length of 11 digits. invoice_id cannot be NULL
  `invoice_id` int(11) NOT NULL,
  
  -- Define the `number` column as a variable character with a maximum length of 50 characters. number cannot be NULL
  `number` varchar(50) NOT NULL,
  
  -- Define the `client_id` column as an integer with a maximum length of 11 digits. client_id cannot be NULL
  `client_id` int(11) NOT NULL,
  
  -- Define the `invoice_total` column as a decimal number with a maximum of 9 digits, 2 of which can be after the decimal point. invoice_total cannot be NULL
  `invoice_total` decimal(9,2) NOT NULL,
  
  -- Define the `payment_total` column as a decimal number with a maximum of 9 digits, 2 of which can be after the decimal point. payment_total cannot be NULL and has a default value of '0.00'
  `payment_total` decimal(9,2) NOT NULL DEFAULT '0.00',
  
  -- Define the `invoice_date` column as a date. invoice_date column cannot be NULL
  `invoice_date` date NOT NULL,
  
  -- Define the `due_date` column as a date. due_date cannot be NULL
  `due_date` date NOT NULL,
  
  -- Define the `payment_date` column as a date. payment_date can be NULL
  `payment_date` date DEFAULT NULL,
  
  -- Set the `invoice_id` column as the primary key for the table
  PRIMARY KEY (`invoice_id`),
  
  -- Create an index on the `client_id` column
  KEY `FK_client_id` (`client_id`),
  
  /*
  Define a foreign key constraint on the `client_id` column.
  This ensures that `client_id` in `invoices` must exist in the `client_id` column in the `clients` table
  `ON DELETE RESTRICT` prevents deleting a client if they have associated invoices
  `ON UPDATE CASCADE` updates the `client_id` in `invoices` if it is updated in the `clients` table
  */
  CONSTRAINT `FK_client_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) 
-- Specify the storage engine to use InnoDB
ENGINE=InnoDB 
-- Set the default character set to UTF-8MB4 for supporting multi-byte characters
DEFAULT CHARSET=utf8mb4 
-- Set the default collation to utf8mb4_0900_ai_ci for case-insensitive comparison
COLLATE=utf8mb4_0900_ai_ci;

--  Insert data into invoice table
INSERT INTO `invoices` VALUES (1,'91-953-3396',2,101.79,0.00,'2019-03-09','2019-03-29',NULL);
INSERT INTO `invoices` VALUES (2,'03-898-6735',5,175.32,8.18,'2019-06-11','2019-07-01','2019-02-12');
INSERT INTO `invoices` VALUES (3,'20-228-0335',5,147.99,0.00,'2019-07-31','2019-08-20',NULL);
INSERT INTO `invoices` VALUES (4,'56-934-0748',3,152.21,0.00,'2019-03-08','2019-03-28',NULL);
INSERT INTO `invoices` VALUES (5,'87-052-3121',5,169.36,0.00,'2019-07-18','2019-08-07',NULL);
INSERT INTO `invoices` VALUES (6,'75-587-6626',1,157.78,74.55,'2019-01-29','2019-02-18','2019-01-03');
INSERT INTO `invoices` VALUES (7,'68-093-9863',3,133.87,0.00,'2019-09-04','2019-09-24',NULL);
INSERT INTO `invoices` VALUES (8,'78-145-1093',1,189.12,0.00,'2019-05-20','2019-06-09',NULL);
INSERT INTO `invoices` VALUES (9,'77-593-0081',5,172.17,0.00,'2019-07-09','2019-07-29',NULL);
INSERT INTO `invoices` VALUES (10,'48-266-1517',1,159.50,0.00,'2019-06-30','2019-07-20',NULL);
INSERT INTO `invoices` VALUES (11,'20-848-0181',3,126.15,0.03,'2019-01-07','2019-01-27','2019-01-11');
INSERT INTO `invoices` VALUES (13,'41-666-1035',5,135.01,87.44,'2019-06-25','2019-07-15','2019-01-26');
INSERT INTO `invoices` VALUES (15,'55-105-9605',3,167.29,80.31,'2019-11-25','2019-12-15','2019-01-15');
INSERT INTO `invoices` VALUES (16,'10-451-8824',1,162.02,0.00,'2019-03-30','2019-04-19',NULL);
INSERT INTO `invoices` VALUES (17,'33-615-4694',3,126.38,68.10,'2019-07-30','2019-08-19','2019-01-15');
INSERT INTO `invoices` VALUES (18,'52-269-9803',5,180.17,42.77,'2019-05-23','2019-06-12','2019-01-08');
INSERT INTO `invoices` VALUES (19,'83-559-4105',1,134.47,0.00,'2019-11-23','2019-12-13',NULL);


-- Create the `payments` table
CREATE TABLE `payments` (
  -- Define the `payment_id` column as an integer with a maximum length of 11 digits. payment_id will auto-increment and cannot be NULL
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  
  -- Define the `client_id` column as an integer with a maximum length of 11 digits. client_id cannot be NULL
  `client_id` int(11) NOT NULL,
  
  -- Define the `invoice_id` column as an integer with a maximum length of 11 digits. invoice_id cannot be NULL
  `invoice_id` int(11) NOT NULL,
  
  -- Define the `date` column as a date. date cannot be NULL
  `date` date NOT NULL,
  
  -- Define the `amount` column as a decimal number with a maximum of 9 digits, 2 of which can be after the decimal point. Amount cannot be NULL
  `amount` decimal(9,2) NOT NULL,
  
  -- Define the `payment_method` column as a tiny integer with a maximum length of 4 digits. payment_method cannot be NULL
  `payment_method` tinyint(4) NOT NULL,
  
  -- Set the `payment_id` column as the primary key for the table
  PRIMARY KEY (`payment_id`),
  
  -- Create an index on the `client_id` column
  KEY `fk_client_id_idx` (`client_id`),
  
  -- Create an index on the `invoice_id` column
  KEY `fk_invoice_id_idx` (`invoice_id`),
  
  -- Create an index on the `payment_method` column
  KEY `fk_payment_payment_method_idx` (`payment_method`),
  
  /*
  Define a foreign key constraint on the `client_id` column. This ensures that `client_id` in `payments` must exist in the `client_id` column in the `clients` table
  `ON UPDATE CASCADE` updates the `client_id` in `payments` if it is updated in the `clients` table
  */
 CONSTRAINT `fk_payment_client` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`) ON UPDATE CASCADE,
  
  /*
  Define a foreign key constraint on the `invoice_id` column. This ensures that `invoice_id` in `payments` must exist in the `invoice_id` column in the `invoices` table
  `ON UPDATE CASCADE` updates the `invoice_id` in `payments` if it is updated in the `invoices` table
   */
  CONSTRAINT `fk_payment_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoice_id`) ON UPDATE CASCADE,
  
  -- Define a foreign key constraint on the `payment_method` column. This ensures that `payment_method` in `payments` must exist in the `payment_method_id` column in the `payment_methods` table

  CONSTRAINT `fk_payment_payment_method` FOREIGN KEY (`payment_method`) REFERENCES `payment_methods` (`payment_method_id`)
) 
-- Specify the storage engine to use InnoDB
ENGINE=InnoDB 
-- Set the auto-increment starting value to 9
AUTO_INCREMENT=9 
-- Set the default character set to UTF-8MB4 for supporting multi-byte characters
DEFAULT CHARSET=utf8mb4 
-- Set the default collation to utf8mb4_0900_ai_ci for case-insensitive comparison
COLLATE=utf8mb4_0900_ai_ci;

-- SELECT * FROM `invoices`;

-- Inssert data into payments table
INSERT INTO `payments` VALUES (1,5,2,'2019-02-12',8.18,1);
INSERT INTO `payments` VALUES (2,1,6,'2019-01-03',74.55,1);
INSERT INTO `payments` VALUES (3,3,11,'2019-01-11',0.03,1);
INSERT INTO `payments` VALUES (4,5,13,'2019-01-26',87.44,1);
INSERT INTO `payments` VALUES (5,3,15,'2019-01-15',80.31,1);
INSERT INTO `payments` VALUES (6,3,17,'2019-01-15',68.10,1);
INSERT INTO `payments` VALUES (7,5,18,'2019-01-08',32.77,1);
INSERT INTO `payments` VALUES (8,5,18,'2019-01-08',10.00,2);


-- sql_store
DROP DATABASE IF EXISTS `sql_store`; -- Delete sql_store database if is exists already.

CREATE DATABASE `sql_store`; -- Create a new database called sql_invoicing

USE `sql_store`; -- Sets the current database to work with as sql_store

-- Create the `products` table
CREATE TABLE `products` (
  -- Define the `product_id` column as an integer with a maximum length of 11 digits. product_id will auto-increment and cannot be NULL
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  
  -- Define the `name` column as a variable character string with a maximum length of 50 characters. name cannot be NULL
  `name` varchar(50) NOT NULL,
  
  -- Define the `quantity_in_stock` column as an integer with a maximum length of 11 digits. quantity_in_stock cannot be NULL
  `quantity_in_stock` int(11) NOT NULL,
  
  -- Define the `unit_price` column as a decimal number with up to 4 digits in total, 2 of which can be after the decimal poin. unit_price cannot be NULL
  `unit_price` decimal(4,2) NOT NULL,
  
  -- Set the `product_id` column as the primary key for the table
  PRIMARY KEY (`product_id`)
) 
-- Specify the storage engine to use InnoDB
ENGINE=InnoDB 
-- Set the auto-increment starting value to 11
AUTO_INCREMENT=11 
-- Set the default character set to UTF-8MB4 for supporting multi-byte characters
DEFAULT CHARSET=utf8mb4 
-- Set the default collation to utf8mb4_0900_ai_ci for case-insensitive comparison
COLLATE=utf8mb4_0900_ai_ci;

-- Insert data into products table
INSERT INTO `products` VALUES (1,'Foam Dinner Plate',70,1.21);
INSERT INTO `products` VALUES (2,'Pork - Bacon,back Peameal',49,4.65);
INSERT INTO `products` VALUES (3,'Lettuce - Romaine, Heart',38,3.35);
INSERT INTO `products` VALUES (4,'Brocolinni - Gaylan, Chinese',90,4.53);
INSERT INTO `products` VALUES (5,'Sauce - Ranch Dressing',94,1.63);
INSERT INTO `products` VALUES (6,'Petit Baguette',14,2.39);
INSERT INTO `products` VALUES (7,'Sweet Pea Sprouts',98,3.29);
INSERT INTO `products` VALUES (8,'Island Oasis - Raspberry',26,0.74);
INSERT INTO `products` VALUES (9,'Longan',67,2.26);
INSERT INTO `products` VALUES (10,'Broom - Push',6,1.09);

-- Create the `shippers` table
CREATE TABLE `shippers` (
  -- Define the `shipper_id` column as a small integer with a maximum length of 6 digits. shipper_id will auto-increment and cannot be NULL
  `shipper_id` smallint(6) NOT NULL AUTO_INCREMENT,
  
  -- Define the `name` column as a variable character string with a maximum length of 50 characters. name cannot be NULL
  `name` varchar(50) NOT NULL,
  
  -- Set the `shipper_id` column as the primary key for the table
  PRIMARY KEY (`shipper_id`)
) 
-- Specify the storage engine to use InnoDB
ENGINE=InnoDB 
-- Set the auto-increment starting value to 6
AUTO_INCREMENT=6 
-- Set the default character set to UTF-8MB4 for supporting multi-byte characters
DEFAULT CHARSET=utf8mb4 
-- Set the default collation to utf8mb4_0900_ai_ci for case-insensitive comparison
COLLATE=utf8mb4_0900_ai_ci;

-- Insert data into shippers
INSERT INTO `shippers` VALUES (1,'Hettinger LLC');
INSERT INTO `shippers` VALUES (2,'Schinner-Predovic');
INSERT INTO `shippers` VALUES (3,'Satterfield LLC');
INSERT INTO `shippers` VALUES (4,'Mraz, Renner and Nolan');
INSERT INTO `shippers` VALUES (5,'Waters, Mayert and Prohaska');

-- DROP TABLE `customers`;

-- Create the `customers` table
CREATE TABLE `customers` (
  -- Define the `customer_id` column as an integer with a maximum length of 11 digits. customer_id will auto-increment and cannot be NULL
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  
  -- Define the `first_name` column as a variable character string with a maximum length of 50 character. first_name cannot be NULL
  `first_name` varchar(50) NOT NULL,
  
  -- Define the `last_name` column as a variable character string with a maximum length of 50 characters. last_name cannot be NULL
  `last_name` varchar(50) NOT NULL,
  
  -- Define the `birth_date` column as a date. birth_date can be NULL and defaults to NULL if not provided
  `birth_date` date DEFAULT NULL,
  
  -- Define the `phone` column as a variable character string with a maximum length of 50 characters. phone can be NULL and defaults to NULL if not provided
  `phone` varchar(50) DEFAULT NULL,
  
  -- Define the `address` column as a variable character string with a maximum length of 50 characters address cannot be NULL
  `address` varchar(50) NOT NULL,
  
  -- Define the `city` column as a variable character string with a maximum length of 50 characters. city cannot be NULL
  `city` varchar(50) NOT NULL,
  
  -- Define the `state` column as a character string with a fixed length of 2 characters. state cannot be NULL
  `state` char(2) NOT NULL,
  
  -- Define the `points` column as an integer with a maximum length of 11 digits. points cannot be NULL and defaults to 0 if not provided
  `points` int(11) NOT NULL DEFAULT '0',
  
  -- Set the `customer_id` column as the primary key for the table
  PRIMARY KEY (`customer_id`)
) 
-- Specify the storage engine to use InnoDB
ENGINE=InnoDB 
-- Set the auto-increment starting value to 11
AUTO_INCREMENT=11 
-- Set the default character set to UTF-8MB4 for supporting multi-byte characters
DEFAULT CHARSET=utf8mb4 
-- Set the default collation to utf8mb4_0900_ai_ci for case-insensitive comparison
COLLATE=utf8mb4_0900_ai_ci;

-- Inssert data into customers table
INSERT INTO `customers` VALUES (1,'Babara','MacCaffrey','1986-03-28','781-932-9754','0 Sage Terrace','Waltham','MA',2273);
INSERT INTO `customers` VALUES (2,'Ines','Brushfield','1986-04-13','804-427-9456','14187 Commercial Trail','Hampton','VA',947);
INSERT INTO `customers` VALUES (3,'Freddi','Boagey','1985-02-07','719-724-7869','251 Springs Junction','Colorado Springs','CO',2967);
INSERT INTO `customers` VALUES (4,'Ambur','Roseburgh','1974-04-14','407-231-8017','30 Arapahoe Terrace','Orlando','FL',457);
INSERT INTO `customers` VALUES (5,'Clemmie','Betchley','1973-11-07',NULL,'5 Spohn Circle','Arlington','TX',3675);
INSERT INTO `customers` VALUES (6,'Elka','Twiddell','1991-09-04','312-480-8498','7 Manley Drive','Chicago','IL',3073);
INSERT INTO `customers` VALUES (7,'Ilene','Dowson','1964-08-30','615-641-4759','50 Lillian Crossing','Nashville','TN',1672);
INSERT INTO `customers` VALUES (8,'Thacher','Naseby','1993-07-17','941-527-3977','538 Mosinee Center','Sarasota','FL',205);
INSERT INTO `customers` VALUES (9,'Romola','Rumgay','1992-05-23','559-181-3744','3520 Ohio Trail','Visalia','CA',1486);
INSERT INTO `customers` VALUES (10,'Levy','Mynett','1969-10-13','404-246-3370','68 Lawn Avenue','Atlanta','GA',796);

-- Create the `order_statuses` table
CREATE TABLE `order_statuses` (
  -- Define the `order_status_id` column as a tiny integer with a maximum length of 4 digits. order_status cannot be NULL
  `order_status_id` tinyint(4) NOT NULL,
  
  -- Define the `name` column as a variable character string with a maximum length of 50 characters. name cannot be NULL
  `name` varchar(50) NOT NULL,
  
  -- Set the `order_status_id` column as the primary key for the table
  PRIMARY KEY (`order_status_id`)
) 
-- Specify the storage engine to use InnoDB
ENGINE=InnoDB 
-- Set the default character set to UTF-8MB4 for supporting multi-byte characters
DEFAULT CHARSET=utf8mb4 
-- Set the default collation to utf8mb4_0900_ai_ci for case-insensitive comparison
COLLATE=utf8mb4_0900_ai_ci;

-- Insert data into order_statuses table
INSERT INTO `order_statuses` VALUES (1,'Processed');
INSERT INTO `order_statuses` VALUES (2,'Shipped');
INSERT INTO `order_statuses` VALUES (3,'Delivered');

-- Create the `orders` table
CREATE TABLE `orders` (
  -- Define the `order_id` column as an integer with a maximum length of 11 digits. order_id will auto-increment and cannot be NULL
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  
  -- Define the `customer_id` column as an integer with a maximum length of 11 digits. customer_id cannot be NULL
  `customer_id` int(11) NOT NULL,
  
  -- Define the `order_date` column as a date. order_date cannot be NULL
  `order_date` date NOT NULL,
  
  -- Define the `status` column as a tiny integer with a maximum length of 4 digits. status cannot be NULL and defaults to 1 if not provided
  `status` tinyint(4) NOT NULL DEFAULT '1',
  
  -- Define the `comments` column as a variable character string with a maximum length of 2000 characters. comments can be NULL and defaults to NULL if not provided
  `comments` varchar(2000) DEFAULT NULL,
  
  -- Define the `shipped_date` column as a date. shipped_date can be NULL and defaults to NULL if not provided
  `shipped_date` date DEFAULT NULL,
  
  -- Define the `shipper_id` column as a small integer with a maximum length of 6 digits. shipper_id can be NULL and defaults to NULL if not provided
  `shipper_id` smallint(6) DEFAULT NULL,
  
  -- Set the `order_id` column as the primary key for the table
  PRIMARY KEY (`order_id`),
  
  -- Create an index on the `customer_id` column
  KEY `fk_orders_customers_idx` (`customer_id`),
  
  -- Create an index on the `shipper_id` column
  KEY `fk_orders_shippers_idx` (`shipper_id`),
  
  -- Create an index on the `status` column
  KEY `fk_orders_order_statuses_idx` (`status`),
  
  /* Add a foreign key constraint on the `customer_id` column
  This references the `customer_id` column in the `customers` table
  On update, cascade the changes
  */
  CONSTRAINT `fk_orders_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON UPDATE CASCADE,
  
   /*Add a foreign key constraint on the `status` column
  This references the `order_status_id` column in the `order_statuses` table
  On update, cascade the changes
   */
  CONSTRAINT `fk_orders_order_statuses` FOREIGN KEY (`status`) REFERENCES `order_statuses` (`order_status_id`) ON UPDATE CASCADE,
   /*
  Add a foreign key constraint on the `shipper_id` column
  This references the `shipper_id` column in the `shippers` table
  On update, cascade the changes
   */
  CONSTRAINT `fk_orders_shippers` FOREIGN KEY (`shipper_id`) REFERENCES `shippers` (`shipper_id`) ON UPDATE CASCADE
) 
-- Specify the storage engine to use InnoDB
ENGINE=InnoDB 
-- Set the auto-increment starting value to 11
AUTO_INCREMENT=11 
-- Set the default character set to UTF-8MB4 for supporting multi-byte characters
DEFAULT CHARSET=utf8mb4 
-- Set the default collation to utf8mb4_0900_ai_ci for case-insensitive comparison
COLLATE=utf8mb4_0900_ai_ci;


-- select * from orders;
-- Insert data into orders

INSERT INTO `orders` VALUES (1,6,'2019-01-30',1,NULL,NULL,NULL);
INSERT INTO `orders` VALUES (2,7,'2018-08-02',2,NULL,'2018-08-03',4);
INSERT INTO `orders` VALUES (3,8,'2017-12-01',1,NULL,NULL,NULL);
INSERT INTO `orders` VALUES (4,2,'2017-01-22',1,NULL,NULL,NULL);
INSERT INTO `orders` VALUES (5,5,'2017-08-25',2,'','2017-08-26',3);
INSERT INTO `orders` VALUES (6,10,'2018-11-18',1,'Aliquam erat volutpat. In congue.',NULL,NULL);
INSERT INTO `orders` VALUES (7,2,'2018-09-22',2,NULL,'2018-09-23',4);
INSERT INTO `orders` VALUES (8,5,'2018-06-08',1,'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.',NULL,NULL);
INSERT INTO `orders` VALUES (9,10,'2017-07-05',2,'Nulla mollis molestie lorem. Quisque ut erat.','2017-07-06',1);
INSERT INTO `orders` VALUES (10,6,'2018-04-22',2,NULL,'2018-04-23',2);


CREATE TABLE `order_items` (
  -- Define the `order_id` column as an integer with a maximum length of 11 digits. order_id will auto-increment and cannot be NULL
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  
  -- Define the `product_id` column as an integer with a maximum length of 11 digits. product_id cannot be NULL
  `product_id` int(11) NOT NULL,
  
  -- Define the `quantity` column as an integer with a maximum length of 11 digits. quantity cannot be NULL
  `quantity` int(11) NOT NULL,
  
  -- Define the `unit_price` column as a decimal with a precision of 4 digits and a scale of 2. unit_price cannot be NULL
  `unit_price` decimal(4,2) NOT NULL,
  
  -- Set the composite primary key for `order_id` and `product_id`
  PRIMARY KEY (`order_id`,`product_id`),
  
  -- Create an index on the `product_id` column
  KEY `fk_order_items_products_idx` (`product_id`),
  
  /* Add a foreign key constraint on the `order_id` column
  This references the `order_id` column in the `orders` table
  On update, cascade the changes
  */
  CONSTRAINT `fk_order_items_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON UPDATE CASCADE,
  
  /* Add a foreign key constraint on the `product_id` column
  This references the `product_id` column in the `products` table
  On update, cascade the changes
  */
  CONSTRAINT `fk_order_items_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON UPDATE CASCADE
) 
-- Specify the storage engine to use InnoDB
ENGINE=InnoDB 
-- Set the auto-increment starting value to 11
AUTO_INCREMENT=11 
-- Set the default character set to UTF-8MB4 for supporting multi-byte characters
DEFAULT CHARSET=utf8mb4 
-- Set the default collation to utf8mb4_0900_ai_ci for case-insensitive comparison
COLLATE=utf8mb4_0900_ai_ci;

-- Inset data into order_items table
INSERT INTO `order_items` VALUES (1,4,4,3.74);
INSERT INTO `order_items` VALUES (2,1,2,9.10);
INSERT INTO `order_items` VALUES (2,4,4,1.66);
INSERT INTO `order_items` VALUES (2,6,2,2.94);
INSERT INTO `order_items` VALUES (3,3,10,9.12);
INSERT INTO `order_items` VALUES (4,3,7,6.99);
INSERT INTO `order_items` VALUES (4,10,7,6.40);
INSERT INTO `order_items` VALUES (5,2,3,9.89);
INSERT INTO `order_items` VALUES (6,1,4,8.65);
INSERT INTO `order_items` VALUES (6,2,4,3.28);
INSERT INTO `order_items` VALUES (6,3,4,7.46);
INSERT INTO `order_items` VALUES (6,5,1,3.45);
INSERT INTO `order_items` VALUES (7,3,7,9.17);
INSERT INTO `order_items` VALUES (8,5,2,6.94);
INSERT INTO `order_items` VALUES (8,8,2,8.59);
INSERT INTO `order_items` VALUES (9,6,5,7.28);
INSERT INTO `order_items` VALUES (10,1,10,6.01);
INSERT INTO `order_items` VALUES (10,9,9,4.28);

CREATE TABLE `sql_store`.`order_item_notes` (
  -- Define the `note_id` column as an integer that cannot be NULL
  `note_id` INT NOT NULL,
  
  -- Define the `order_Id` column as an integer that cannot be NULL
  `order_Id` INT NOT NULL,
  
  -- Define the `product_id` column as an integer that cannot be NULL
  `product_id` INT NOT NULL,
  
  -- Define the `note` column as a variable character string with a maximum length of 255 characters that cannot be NULL
  `note` VARCHAR(255) NOT NULL,
  
  -- Set the `note_id` column as the primary key for the table
  PRIMARY KEY (`note_id`)
);

INSERT INTO `order_item_notes` (`note_id`, `order_Id`, `product_id`, `note`) VALUES ('1', '1', '2', 'first note');
INSERT INTO `order_item_notes` (`note_id`, `order_Id`, `product_id`, `note`) VALUES ('2', '1', '2', 'second note');

-- sql_hr
DROP DATABASE IF EXISTS `sql_hr`; -- Delete sql_hr database if is exists already.

CREATE DATABASE `sql_hr`;  -- Create a new database called sql_hr

USE `sql_hr`; -- Sets the current database to work with as sql_hr

-- Create a new table named `offices`
CREATE TABLE `offices` (
  -- Define `office_id` as an integer column that cannot contain NULL values
  `office_id` int(11) NOT NULL,
  
  -- Define `address` as a varchar column with a maximum length of 50 characters, which cannot contain NULL values
  `address` varchar(50) NOT NULL,
  
  -- Define `city` as a varchar column with a maximum length of 50 characters, which cannot contain NULL values
  `city` varchar(50) NOT NULL,
  
  -- Define `state` as a varchar column with a maximum length of 50 characters, which cannot contain NULL values
  `state` varchar(50) NOT NULL,
  
  -- Set `office_id` as the primary key for the table
  PRIMARY KEY (`office_id`)
) 
-- Specify the storage engine to use InnoDB for transaction safety and referential integrity
ENGINE=InnoDB 
-- Set the default character set to UTF-8MB4 for supporting multi-byte characters
DEFAULT CHARSET=utf8mb4 
-- Set the default collation to utf8mb4_0900_ai_ci for case-insensitive comparison
COLLATE=utf8mb4_0900_ai_ci;
 
 -- Inset data into offices table
INSERT INTO `offices` VALUES (1,'03 Reinke Trail','Cincinnati','OH');
INSERT INTO `offices` VALUES (2,'5507 Becker Terrace','New York City','NY');
INSERT INTO `offices` VALUES (3,'54 Northland Court','Richmond','VA');
INSERT INTO `offices` VALUES (4,'08 South Crossing','Cincinnati','OH');
INSERT INTO `offices` VALUES (5,'553 Maple Drive','Minneapolis','MN');
INSERT INTO `offices` VALUES (6,'23 North Plaza','Aurora','CO');
INSERT INTO `offices` VALUES (7,'9658 Wayridge Court','Boise','ID');
INSERT INTO `offices` VALUES (8,'9 Grayhawk Trail','New York City','NY');
INSERT INTO `offices` VALUES (9,'16862 Westend Hill','Knoxville','TN');
INSERT INTO `offices` VALUES (10,'4 Bluestem Parkway','Savannah','GA');

-- Create a new table named `employees`
CREATE TABLE `employees` (
  -- Define `employee_id` as an integer column that cannot contain NULL values
  `employee_id` int(11) NOT NULL,
  
  -- Define `first_name` as a varchar column with a maximum length of 50 characters, which cannot contain NULL values
  `first_name` varchar(50) NOT NULL,
  
  -- Define `last_name` as a varchar column with a maximum length of 50 characters, which cannot contain NULL values
  `last_name` varchar(50) NOT NULL,
  
  -- Define `job_title` as a varchar column with a maximum length of 50 characters, which cannot contain NULL values
  `job_title` varchar(50) NOT NULL,
  
  -- Define `salary` as an integer column that cannot contain NULL values
  `salary` int(11) NOT NULL,
  
  -- Define `reports_to` as an integer column that can contain NULL values, representing the ID of the employee's manager
  `reports_to` int(11) DEFAULT NULL,
  
  -- Define `office_id` as an integer column that cannot contain NULL values
  `office_id` int(11) NOT NULL,
  
  -- Set `employee_id` as the primary key for the table
  PRIMARY KEY (`employee_id`),
  
  -- Create an index on the `office_id` column
  KEY `fk_employees_offices_idx` (`office_id`),
  
  -- Create an index on the `reports_to` column, which references `employee_id` in the same table
  KEY `fk_employees_employees_idx` (`reports_to`),
  
  /* Add a foreign key constraint on the `reports_to` column
  This references the `employee_id` column in the `employees` table,
  establishing a hierarchical relationship where an employee can report to another employee
  */
  CONSTRAINT `fk_employees_managers` FOREIGN KEY (`reports_to`) REFERENCES `employees` (`employee_id`),
  
  /* Add a foreign key constraint on the `office_id` column
  This references the `office_id` column in the `offices` table,
  ensuring each employee is associated with an office
  On update, cascade the changes
  */
  CONSTRAINT `fk_employees_offices` FOREIGN KEY (`office_id`) REFERENCES `offices` (`office_id`) ON UPDATE CASCADE
) 
-- Specify the storage engine to use InnoDB for transaction safety and referential integrity
ENGINE=InnoDB 
-- Set the default character set to UTF-8MB4 for supporting multi-byte characters
DEFAULT CHARSET=utf8mb4 
-- Set the default collation to utf8mb4_0900_ai_ci for case-insensitive comparison
COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `employees` VALUES (37270,'Yovonnda','Magrannell','Executive Secretary',63996,NULL,10);
INSERT INTO `employees` VALUES (33391,'D\'arcy','Nortunen','Account Executive',62871,37270,1);
INSERT INTO `employees` VALUES (37851,'Sayer','Matterson','Statistician III',98926,37270,1);
INSERT INTO `employees` VALUES (40448,'Mindy','Crissil','Staff Scientist',94860,37270,1);
INSERT INTO `employees` VALUES (56274,'Keriann','Alloisi','VP Marketing',110150,37270,1);
INSERT INTO `employees` VALUES (63196,'Alaster','Scutchin','Assistant Professor',32179,37270,2);
INSERT INTO `employees` VALUES (67009,'North','de Clerc','VP Product Management',114257,37270,2);
INSERT INTO `employees` VALUES (67370,'Elladine','Rising','Social Worker',96767,37270,2);
INSERT INTO `employees` VALUES (68249,'Nisse','Voysey','Financial Advisor',52832,37270,2);
INSERT INTO `employees` VALUES (72540,'Guthrey','Iacopetti','Office Assistant I',117690,37270,3);
INSERT INTO `employees` VALUES (72913,'Kass','Hefferan','Computer Systems Analyst IV',96401,37270,3);
INSERT INTO `employees` VALUES (75900,'Virge','Goodrum','Information Systems Manager',54578,37270,3);
INSERT INTO `employees` VALUES (76196,'Mirilla','Janowski','Cost Accountant',119241,37270,3);
INSERT INTO `employees` VALUES (80529,'Lynde','Aronson','Junior Executive',77182,37270,4);
INSERT INTO `employees` VALUES (80679,'Mildrid','Sokale','Geologist II',67987,37270,4);
INSERT INTO `employees` VALUES (84791,'Hazel','Tarbert','General Manager',93760,37270,4);
INSERT INTO `employees` VALUES (95213,'Cole','Kesterton','Pharmacist',86119,37270,4);
INSERT INTO `employees` VALUES (96513,'Theresa','Binney','Food Chemist',47354,37270,5);
INSERT INTO `employees` VALUES (98374,'Estrellita','Daleman','Staff Accountant IV',70187,37270,5);
INSERT INTO `employees` VALUES (115357,'Ivy','Fearey','Structural Engineer',92710,37270,5);

DROP DATABASE IF EXISTS `sql_inventory`; -- Delete sql_inventory database if is exists already

CREATE DATABASE `sql_inventory`; -- Create a new database called sql_inventory

USE `sql_inventory`; -- -- Sets the current database to work with as sql_inventory

-- Create a new table named `products`
CREATE TABLE `products` (
  -- Define `product_id` as an integer column that auto-increments and cannot contain NULL values
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  
  -- Define `name` as a varchar column with a maximum length of 50 characters, which cannot contain NULL values
  `name` varchar(50) NOT NULL,
  
  -- Define `quantity_in_stock` as an integer column that cannot contain NULL values
  `quantity_in_stock` int(11) NOT NULL,
  
  -- Define `unit_price` as a decimal column with a precision of 4 digits and 2 decimal places, which cannot contain NULL values
  `unit_price` decimal(4,2) NOT NULL,
  
  -- Set `product_id` as the primary key for the table
  PRIMARY KEY (`product_id`)
) 
-- Specify the storage engine to use InnoDB for transaction safety and referential integrity
ENGINE=InnoDB 
-- Set the auto-increment starting value to 11
AUTO_INCREMENT=11 
-- Set the default character set to UTF-8MB4 for supporting multi-byte characters
DEFAULT CHARSET=utf8mb4 
-- Set the default collation to utf8mb4_0900_ai_ci for case-insensitive comparison
COLLATE=utf8mb4_0900_ai_ci;

-- Insert data into the products table
INSERT INTO `products` VALUES (1,'Foam Dinner Plate',70,1.21);
INSERT INTO `products` VALUES (2,'Pork - Bacon,back Peameal',49,4.65);
INSERT INTO `products` VALUES (3,'Lettuce - Romaine, Heart',38,3.35);
INSERT INTO `products` VALUES (4,'Brocolinni - Gaylan, Chinese',90,4.53);
INSERT INTO `products` VALUES (5,'Sauce - Ranch Dressing',94,1.63);
INSERT INTO `products` VALUES (6,'Petit Baguette',14,2.39);
INSERT INTO `products` VALUES (7,'Sweet Pea Sprouts',98,3.29);
INSERT INTO `products` VALUES (8,'Island Oasis - Raspberry',26,0.74);
INSERT INTO `products` VALUES (9,'Longan',67,2.26);
INSERT INTO `products` VALUES (10,'Broom - Push',6,1.09);


-- Queries
USE sql_store;
SELECT * FROM customers
WHERE customer_id = 1
order by first_name;

-- Task 1
SELECT  last_name,first_name, points, points*10 + 100 AS discount_factor
FROM customers;

SELECT  last_name,first_name, points, (points + 10) * 100 AS discount_factor
FROM customers;

-- Task 2
SELECT name, unit_price, unit_price * 1.1 AS new_price
FROM products;

SELECT * 
FROM customers 
WHERE birth_date > '1990-01-01';


USE `sql_inventory`; -- Use `sql_inventory` database
-- Retrieve the name of the product(s) with the maximum quantity in stock from the `products` table
SELECT name
FROM products
WHERE quantity_in_stock = (
    -- Subquery: Find the maximum quantity_in_stock from the `products` table
    SELECT MAX(quantity_in_stock)
    FROM products
);


USE `sql_inventory`; -- Use `sql_inventory` database
-- SELECT * FROM products ORDER BY unit_price DESC;
-- Retrieve the name of the product(s) with the maximum unit_price from the `products` table
SELECT name
FROM products
WHERE unit_price = (
	-- Subquery: Find the maximum unit_price from the `products` table
    SELECT MAX(unit_price)
    FROM products
);

USE `sql_store`; -- Use `sql_store` database
-- SELECT * FROM customers ORDER BY birth_date ASC;
-- Retrieve the first name, last name, address, and birth date of the oldest customer in the `customers` table
SELECT first_name, last_name, address, birth_date
FROM customers
WHERE birth_date = (
    -- Subquery: Find the minimum birth_date from the `customers` table, which corresponds to the oldest customer
    SELECT MIN(birth_date)
    FROM customers
);

