# 1.查询同时存在1课程和2课程的情况
SELECT id,NAME,studentId,courseId,score FROM student a,student_course b WHERE a.id=b.studentId 
AND courseId="1" AND id 
IN (SELECT id FROM student a,student_course b WHERE a.id=b.studentId AND courseId="2")	

# 2.查询同时存在1课程和2课程的情况
同上

# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
SELECT id,NAME,AVG(b.score) FROM student a JOIN student_course b ON a.id=studentId
GROUP BY a.id
HAVING AVG(b.score>=60)

# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
SELECT * FROM student WHERE id NOT IN(SELECT studentId FROM student_course)

# 5.查询所有有成绩的SQL
SELECT * FROM student a,student_course b WHERE a.id=b.studentId;
SELECT * FROM student a JOIN student_course b ON a.id=b.studentId;
SELECT * FROM student_course b LEFT JOIN student a ON b.studentId=a.id;

# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
SELECT id,NAME,studentId,courseId,score FROM student a,student_course b WHERE a.id=b.studentId 
AND courseId="1" AND id 
IN (SELECT id FROM student a,student_course b WHERE a.id=b.studentId AND courseId="2")	

# 7.检索1课程分数小于60，按分数降序排列的学生信息
SELECT * FROM student a JOIN student_course b ON a.id=b.studentId
WHERE courseId="1" AND score<60 ORDER BY score DESC

# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
SELECT courseId,AVG(b.score) FROM student_course b
GROUP BY b.courseId
ORDER BY AVG(b.score) DESC,b.courseId ASC

# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
SELECT a.name,b.score FROM student a,student_course b,course c WHERE a.`id`=b.`studentId` AND b.`courseId`=c.id
AND c.name="数学" AND b.score<60
