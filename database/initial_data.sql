USE mp_admin;

INSERT INTO `mp_admin`.`Role` (`id`, `name`, `description`) VALUES ('1', 'administrator', 'All permissions');
INSERT INTO `mp_admin`.`Role` (`id`, `name`, `description`) VALUES ('2', 'operator', 'Calendar and live mode access');
INSERT INTO `mp_admin`.`Role` (`id`, `name`, `description`) VALUES ('3', 'analyst', 'Access only reports');
INSERT INTO `mp_admin`.`Role` (`id`, `name`, `description`) VALUES ('4', 'dataEntry', 'Access only media ABM');

INSERT INTO User (name, surname, username, password, idRole)
VALUES ("admin", "admin", "admin", "admin", 1);

INSERT INTO `mp_admin`.`Action`
VALUES  (1,'View Scheduler Mode',NULL),
		(2,'View Live Mode',NULL),
		(3,'View Reports',NULL),
		(4,'View Medias',NULL),
		(5,'Manage Users',NULL);

INSERT INTO `mp_admin`.`UserActions`(`idUser`,`idAction`) VALUES (1,1),(1,2),(1,3),(1,4),(1,5);

INSERT INTO `mp_playout`.`Filter` (`id`, `name`, `description`) VALUES ('2', 'grayscale', 'Turns color output into a grayscale');
INSERT INTO `mp_playout`.`Filter` (`id`, `name`, `description`) VALUES ('4', 'dynamictext', 'Displays the current time over the output');
INSERT INTO `mp_playout`.`Filter` (`id`, `name`, `description`) VALUES ('3', 'oldfilm', 'Applies an old film effect');
INSERT INTO `mp_playout`.`Filter` (`id`, `name`, `description`) VALUES ('1', 'dust', 'Applies dust particles over the output');
INSERT INTO `mp_playout`.`Filter` (`id`, `name`, `description`) VALUES ('5', 'watermark', 'Displays an image over the output');

INSERT INTO `mp_playout`.`FilterArgs` (`id`, `filterId`, `key`, `description`) VALUES ('1', '1', 'mlt_service', 'id of filter');
INSERT INTO `mp_playout`.`FilterArgs` (`id`, `filterId`, `key`, `description`) VALUES ('2', '2', 'mlt_service', 'id of filter');
INSERT INTO `mp_playout`.`FilterArgs` (`id`, `filterId`, `key`, `description`) VALUES ('3', '3', 'mlt_service', 'id of filter');
INSERT INTO `mp_playout`.`FilterArgs` (`id`, `filterId`, `key`, `description`) VALUES ('4', '4', 'mlt_service', 'id of filter');
INSERT INTO `mp_playout`.`FilterArgs` (`id`, `filterId`, `key`, `description`) VALUES ('5', '5', 'mlt_service', 'id of filter');
