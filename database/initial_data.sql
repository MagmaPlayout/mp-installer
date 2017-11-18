-- Creates ROLES
INSERT INTO `mp_admin`.`Role` (`id`, `name`, `description`) 
VALUES 	('1', 'administrator', 'All permissions'),
		('2', 'operator', 'Calendar and live mode access'),
		('3', 'analyst', 'Access only reports'),
		('4', 'dataEntry', 'Access only media ABM');

-- Creates ACTIONS
INSERT INTO `mp_admin`.`Action`
VALUES  (1,'View Scheduler Mode',NULL),
		(2,'View Live Mode',NULL),
		(3,'View Reports',NULL),
		(4,'View Medias',NULL),
		(5,'Manage Users',NULL);

-- Assigns ACTIONS to ROLES
INSERT INTO `mp_admin`.`RoleActions` (`idRole`, `idAction`)
VALUES (1,1), (1,2), (1,3), (1,4), (1,5), (2,1), (2,2), (3,3), (4,4);

-- Creates ADMIN user
INSERT INTO `mp_admin`.`User` (`name`, `surname`, `username`, `password`, `idRole`)
VALUES ('administrator', ' ', 'admin', 'admin', 1);

-- Creates Filters
INSERT INTO `mp_playout`.`Filter` (`id`, `name`, `description`) 
VALUES 	('2', 'grayscale', 'Turns color output into a grayscale'),
		('4', 'dynamictext', 'Displays the current time over the output'),
		('3', 'oldfilm', 'Applies an old film effect'),
		('1', 'dust', 'Applies dust particles over the output'),
		('5', 'watermark', 'Displays an image over the output');

INSERT INTO `mp_playout`.`FilterArgs` (`id`, `filterId`, `key`, `description`) 
VALUES  ('1', '1', 'mlt_service', 'id of filter'),
		('2', '2', 'mlt_service', 'id of filter'),
		('3', '3', 'mlt_service', 'id of filter'),
		('4', '4', 'mlt_service', 'id of filter'),
		('5', '5', 'mlt_service', 'id of filter');




