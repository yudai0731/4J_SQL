CREATE TABLE goods (
 code CHAR(32) NOT NULL PRIMARY KEY,
 name VARCHAR(40),
 size CHAR(4),
 color CHAR(6),
 price INT,
 quantity INT
);


CREATE TABLE customer (
 id INT NOT NULL PRIMARY KEY,
 name CHAR(10),
 post VARCHAR(256),
 address VARCHAR(256),
 tel CHAR(15),
 mail VARCHAR(500)
);


CREATE TABLE sales (
 id CHAR(10) NOT NULL PRIMARY KEY,
 date DATE,
 quantity INT,
 goods_code CHAR(32),
 customer_id INT,

 FOREIGN KEY (goods_code) REFERENCES goods (code),
 FOREIGN KEY (customer_id) REFERENCES customer (id)
);


