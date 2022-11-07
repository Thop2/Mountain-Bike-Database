DROP DATABASE IF EXISTS `mtnbikes`;
CREATE DATABASE `mtnbikes`;
USE `mtnbikes`;

CREATE TABLE `bikes` (
`bike_id` INT(4) NOT NULL AUTO_INCREMENT,
`bike_make` VARCHAR(255) NOT NULL,
`bike_model` VARCHAR(255) NOT NULL,
`bike_size` CHAR(3) NOT NULL,
`wheel_size` DECIMAL(3,1) NOT NULL,
`travel` INT(3) NOT NULL,
PRIMARY KEY(`bike_id`)
);

CREATE TABLE `riders` (
`rider_id` INT(4) NOT NULL AUTO_INCREMENT,
`first_name` CHAR(255) NOT NULL,
`last_name` CHAR(255) NOT NULL,
`sex` CHAR(1) NOT NULL,
`rider_height` NUMERIC(10) NOT NULL,
`rider_weight` INT(3) NOT NULL,
`rider_skill` INT(3) NOT NULL,
`bike_id` INT(4) NOT NULL,
PRIMARY KEY(`rider_id`),
KEY `fk_bike_id` (`bike_id`),
CONSTRAINT `fk_bike_id` FOREIGN KEY (`bike_id`) REFERENCES `bikes` (`bike_id`) ON DELETE RESTRICT ON UPDATE CASCADE 
);

CREATE TABLE `routes` (
`route_id` INT(5) NOT NULL AUTO_INCREMENT,
`route_name` VARCHAR(255) NOT NULL,
`state_location` CHAR(2) NOT NULL,
`city_location` VARCHAR(255) NOT NULL,
`route_length_miles` DECIMAL(4,2) NOT NULL,
`climb` DECIMAL(5,2),
`descend` DECIMAL(5,2),
`bike_id` INT(4) NOT NULL,
`rider_id` INT(4) NOT NULL,
PRIMARY KEY(`route_id`),
KEY `fk_bike_idx` (`bike_id`),
KEY `fk_rider_id` (`rider_id`),
CONSTRAINT `fk_bike_route` FOREIGN KEY (`bike_id`) REFERENCES `bikes` (`bike_id`) ON UPDATE CASCADE,
CONSTRAINT `fk_rider_route` FOREIGN KEY (`rider_id`) REFERENCES `riders` (`rider_id`) ON UPDATE CASCADE
);


