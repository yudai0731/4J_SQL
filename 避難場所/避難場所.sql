CREATE TABLE sediment_disaster_note (
 sediment_disaster_notes_id INT NOT NULL PRIMARY KEY,
 note VARCHAR(10)
);


CREATE TABLE earthquake_note (
 earthquake_note_id INT NOT NULL PRIMARY KEY,
 note VARCHAR(50)
);


CREATE TABLE district (
 district_id INT NOT NULL PRIMARY KEY,
 name VARCHAR(10) NOT NULL
);


CREATE TABLE flood_note (
 flood_note_id INT NOT NULL PRIMARY KEY,
 note VARCHAR(50)
);


CREATE TABLE bool (
 bool_id BIT(1) NOT NULL PRIMARY KEY,
 status CHAR(2) NOT NULL
);


CREATE TABLE place (
 code INT NOT NULL PRIMARY KEY,
 name VARCHAR(100) NOT NULL,
 kana VARCHAR(100),
 address VARCHAR(50) NOT NULL,
 latitude FLOAT(10) NOT NULL,
 longitude FLOAT(10) NOT NULL,
 district_id INT,

 FOREIGN KEY (district_id) REFERENCES district (district_id)
);


CREATE TABLE attribute (
 code INT NOT NULL PRIMARY KEY,
 wide_area CHAR(2),
 designation CHAR(2),

 FOREIGN KEY (code) REFERENCES place (code)
);


CREATE TABLE  sediment_disaster (
 code INT NOT NULL PRIMARY KEY,
 sediment_disaster_notes_id INT,
 suitability CHAR(2),

 FOREIGN KEY (code) REFERENCES place (code),
 FOREIGN KEY (sediment_disaster_notes_id) REFERENCES sediment_disaster_note (sediment_disaster_notes_id)
);


CREATE TABLE earthquake (
 code INT NOT NULL PRIMARY KEY,
 earthquake_note_id INT,
 suitability CHAR(2),

 FOREIGN KEY (code) REFERENCES place (code),
 FOREIGN KEY (earthquake_note_id) REFERENCES earthquake_note (earthquake_note_id)
);


CREATE TABLE fire (
 code INT NOT NULL PRIMARY KEY,
 suitability CHAR(2),

 FOREIGN KEY (code) REFERENCES place (code)
);


CREATE TABLE flood (
 code INT NOT NULL PRIMARY KEY,
 flood_note_id INT,
 suitability CHAR(2),

 FOREIGN KEY (code) REFERENCES place (code),
 FOREIGN KEY (flood_note_id) REFERENCES flood_note (flood_note_id)
);


