USE mp_admin;
INSERT INTO User (name, surname, username, password)
VALUES ("admin", "admin", "admin", "admin");

INSERT INTO `mp_admin`.`Role` (`id`, `name`, `description`) VALUES ('1', 'super', 'All permissions');
INSERT INTO `mp_admin`.`Role` (`id`, `name`, `description`) VALUES ('2', 'programmer', 'Calendar and live mode access');
INSERT INTO `mp_admin`.`Role` (`id`, `name`, `description`) VALUES ('3', 'reports', 'Access only reports');
INSERT INTO `mp_admin`.`Role` (`id`, `name`, `description`) VALUES ('4', 'media', 'Access only media ABM');


INSERT INTO `mp_playout`.`Filter` (`id`, `name`, `description`) VALUES ('2', 'grayscale', 'Turns color output into a grayscale');
INSERT INTO `mp_playout`.`Filter` (`id`, `name`, `description`) VALUES ('4', 'time', 'Displays the current time over the output');
INSERT INTO `mp_playout`.`Filter` (`id`, `name`, `description`) VALUES ('3', 'oldfilm', 'Applies an old film effect');
INSERT INTO `mp_playout`.`Filter` (`id`, `name`, `description`) VALUES ('1', 'dust', 'Applies dust particles over the output');
INSERT INTO `mp_playout`.`Filter` (`id`, `name`, `description`) VALUES ('5', 'watermark', 'Displays an image over the output');

