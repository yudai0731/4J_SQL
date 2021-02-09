INSERT INTO gender (gender_id,gender) VALUES
(1,"男"),
(2,"女");

INSERT INTO place (place_id,place) VALUES
(1,"管理・一般校舎"),
(2,"電子制御工学科棟"),
(3,"電気電子・機械工学科棟"),
(4,"電子情報工学科棟"),
(5,"環境都市工学科棟"),
(6,"情報教育センター"),
(7,"図書館センター"),
(8,"体育館");

INSERT INTO faculty(faculty_id,faculty,place_id) VALUES
(1,"機械工学科",3),
(2,"電気電子工学科",3),
(3,"電子制御工学科",2),
(4,"電子情報工学科",4),
(5,"環境都市工学科",5);

INSERT INTO teacher(teacher_id,name) VALUES
("G002","長松次郎"),
("G001","長松遥"),
("G005","高田真由"),
("E012","三浦裕"),
("M301","上条雄三"),
("M553","西岡剛");

INSERT INTO subject(subject_id,name,teacher_id) VALUES
(10001,"国語II","G002"),
(10002,"物理I","G001"),
(10003,"現代社会","G005"),
(10004,"電気工学","E012"),
(10005,"信号処理","E012"),
(10006,"機械力学","M301"),
(10007,"計測工学","M553");

INSERT INTO student(code,name,age,gender_id,faculty_id) VALUES
("26401","山川一郎",18,1,4),
("26205","谷泉太郎",19,1,2),
("26132","海土花子",20,2,1);

INSERT INTO score(subject_id,code,score,date) VALUES
(10001,26401,65,'2018-6-10'),
(10002,26401,42,'2018-6-11'),
(10003,26401,79,'2018-6-14'),
(10002,26205,76,'2018-6-11'),
(10004,26205,66,'2018-6-12'),
(10005,26205,90,'2018-6-12'),
(10002,26132,87,'2018-6-10'),
(10006,26132,78,'2018-6-11'),
(10007,26132,100,'2018-6-12');

INSERT INTO result(result_id,result,max,min) VALUES
(1,"優",100,80),
(2,"良",79,70),
(3,"可",69,60),
(4,"不可",59,0);


SELECT * FROM faculty;
SELECT * FROM gender;
SELECT * FROM place;
SELECT * FROM result;
SELECT * FROM score;
SELECT * FROM student;
SELECT * FROM subject;
SELECT * FROM teacher;