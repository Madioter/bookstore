create DATABASE bookstore DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE t_notice_bg
(
    id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    position_x INT(11),
    position_y INT(11),
    width INT(11),
    height INT(11),
    backgound_path VARCHAR(200),
    used INT(11) DEFAULT '0',
    title VARCHAR(20),
    notice_count INT(11) DEFAULT '1' NOT NULL
);

CREATE TABLE t_notice
(
    id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    img_path VARCHAR(200),
    link VARCHAR(200),
    alt VARCHAR(20),
    title VARCHAR(200),
    top INT(11)
);