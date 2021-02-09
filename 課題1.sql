CREATE TABLE result (
 result_id INT NOT NULL PRIMARY KEY,
 result VARCHAR(6) NOT NULL,
 max INT NOT NULL,
 min INT NOT NULL
);


CREATE TABLE gender (
 gender_id INT NOT NULL PRIMARY KEY,
 gender CHAR(4) NOT NULL
);


CREATE TABLE teacher (
 teacher_id VARCHAR(4) NOT NULL PRIMARY KEY,
 name VARCHAR(40) NOT NULL
);


CREATE TABLE place (
 place_id INT NOT NULL PRIMARY KEY,
 place VARCHAR(40) NOT NULL
);


CREATE TABLE subject (
 subject_id INT NOT NULL PRIMARY KEY,
 name VARCHAR(40) NOT NULL,
 teacher_id VARCHAR(4),

 FOREIGN KEY (teacher_id) REFERENCES teacher (teacher_id)
);


CREATE TABLE faculty (
 faculty_id INT NOT NULL PRIMARY KEY,
 faculty VARCHAR(40) NOT NULL,
 place_id INT NOT NULL,

 FOREIGN KEY (place_id) REFERENCES place (place_id)
);


CREATE TABLE student (
 code CHAR(5) NOT NULL PRIMARY KEY,
 name VARCHAR(40) NOT NULL,
 age INT,
 gender_id INT,
 faculty_id INT NOT NULL,

 FOREIGN KEY (gender_id) REFERENCES gender (gender_id),
 FOREIGN KEY (faculty_id) REFERENCES faculty (faculty_id)
);


CREATE TABLE score (
 subject_id INT NOT NULL,
 code CHAR(5) NOT NULL,
 score INT NOT NULL,
 date DATE NOT NULL,

 PRIMARY KEY (subject_id,code),

 FOREIGN KEY (subject_id) REFERENCES subject (subject_id),
 FOREIGN KEY (code) REFERENCES student (code)
);


