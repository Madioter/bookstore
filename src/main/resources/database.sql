create DATABASE bookstore DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE bookstore.t_notice_bg
(
  id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  position_x INT(11),
  position_y INT(11),
  width INT(11),
  height INT(11),
  background_path VARCHAR(200),
  used INT(11) DEFAULT '0',
  name VARCHAR(20),
  notice_count INT(11) DEFAULT '1' NOT NULL
);

CREATE TABLE bookstore.t_notice
(
  id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  img_path VARCHAR(200),
  link VARCHAR(200),
  alt VARCHAR(20),
  title VARCHAR(200),
  top INT(11)
);

CREATE TABLE bookstore.t_book
(
  id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  title VARCHAR(200) NOT NULL,
  author VARCHAR(50),
  publication_date DATE,
  press VARCHAR(100),
  isbn VARCHAR(50),
  pages INT(11),
  cost DECIMAL(4,2),
  cover_path VARCHAR(200),
  description VARCHAR(1000),
  add_time DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
  link VARCHAR(200),
  type INT(11),
  is_delete INT(11) DEFAULT '0' NOT NULL
);

CREATE TABLE bookstore.t_best_sale_list
(
  id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  book_id INT(11) NOT NULL
);

CREATE TABLE bookstore.t_new_book_list
(
  id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  book_id INT(11) NOT NULL
);

CREATE TABLE bookstore.t_recommended_list
(
  id      INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  book_id INT(11)             NOT NULL
);
