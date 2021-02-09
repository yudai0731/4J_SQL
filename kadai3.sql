 -- 課題3-1
 SELECT student.code,student.name,student.age,gender.gender,faculty.faculty,place.place,
 subject.name,score.score,result.result,teacher.teacher_id,teacher.name,score.date
 FROM student  
 INNER JOIN score ON score.code = student.code
 INNER JOIN gender ON student.gender_id = gender.gender_id 
 INNER JOIN faculty ON student.faculty_id = faculty.faculty_id
 INNER JOIN place ON faculty.place_id = place.place_id
 INNER JOIN subject ON subject.subject_id = score.subject_id
 INNER JOIN teacher ON teacher.teacher_id = subject.teacher_id
 INNER JOIN result ON score.score <= result.max AND score.score >= result.min  
 ORDER BY student.age ASC
 ;

 -- 課題3-2
 SELECT DISTINCT student.code,student.name,faculty.faculty
 FROM student INNER JOIN faculty ON faculty.faculty_id = student.faculty_id 
 INNER JOIN score ON score.code = student.code
 INNER JOIN result ON score.score <= result.max AND score.score >= result.min
 WHERE result.result = "優"
 ;

 --課題3-3
 SELECT student.name,subject.name,teacher.name,result.result
 FROM student INNER JOIN score ON score.code = student.code
 INNER JOIN subject ON subject.subject_id = score.subject_id 
 INNER JOIN teacher ON teacher.teacher_id = subject.teacher_id
 INNER JOIN result ON score.score <= result.max AND score.score >= result.min
 WHERE teacher.name LIKE "三浦%" OR teacher.name LIKE "高田%" 
 ORDER BY student.age ASC
 ;


  -- 課題3-4
 SELECT student.name,subject.name,score.score
 FROM student INNER JOIN score ON score.code = student.code
 INNER JOIN subject ON subject.subject_id = score.subject_id 
 WHERE subject.name LIKE "%学%"
 ORDER BY student.age ASC
 ;

  -- 課題3-4比較用
 SELECT student.name,subject.name,score.score
 FROM student INNER JOIN score ON score.code = student.code
 INNER JOIN subject ON subject.subject_id = score.subject_id 
 ORDER BY student.age ASC
 ;

 --課題3-5
 SELECT AVG(score.score)
 FROM student INNER JOIN score ON score.code = student.code
 INNER JOIN subject ON subject.subject_id = score.subject_id 
 INNER JOIN teacher ON teacher.teacher_id = subject.teacher_id
 WHERE teacher.name LIKE "三浦%"
 ;

 --課題3-5検証用
 SELECT student.name,subject.name,score.score,teacher.name
 FROM student INNER JOIN score ON score.code = student.code
 INNER JOIN subject ON subject.subject_id = score.subject_id 
 INNER JOIN teacher ON teacher.teacher_id = subject.teacher_id
 ORDER BY student.age ASC
 ;
