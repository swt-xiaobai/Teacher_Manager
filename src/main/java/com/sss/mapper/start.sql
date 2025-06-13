CREATE DATABASE my_database;
use my_database;
CREATE TABLE IF NOT EXISTS Teacher_table (id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(50) NOT NULL,account int PRIMARY KEY ,password int not null,age int not null,sex char(1) not null,der VARCHAR(10) not null,ders VARCHAR(50) not null,created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
INSERT INTO Teacher_table (name,account,password,age,sex,der,ders) 
           		VALUES ('张三','100001','100001',30,'男','数学老师','毕业于湖南财政经济学院，有5年教学经验。');
INSERT INTO Teacher_table (name,account,password,age,sex,der,ders)
				VALUES ('李四','100002','100002',45,'男','数学教授','毕业于湖南师范大学，博士生，有15年教学经验。');
INSERT INTO Teacher_table (name,account,password,age,sex,der,ders) 
				VALUES ('王五','100003','100003',25,'男','物理老师','毕业于清华大学，物理系研究生，暂无教学经验。');
INSERT INTO Teacher_table (name,account,password,age,sex,der,ders) 
           		VALUES ('韩梅梅','100004','100004',28,'女','英语老师','毕业于武汉大学，有6年教学经验。');
INSERT INTO Teacher_table (name,account,password,age,sex,der,ders) 
           		VALUES ('李明','100005','100005',33,'男','英语老师','毕业于长沙师范大学，英语系博士，有6年教学经验。');
           		
CREATE TABLE IF NOT EXISTS Course_table (course_name VARCHAR(10) not null,Time VARCHAR(20) NOT NULL,teacher VARCHAR(10),class_time int not null, Taccount VARCHAR(20));
INSERT INTO Course_table (course_name,Time,teacher,class_time,Taccount) 
           		VALUES ("高等数学（1）","2025-2026上","张三",40,"100001");
INSERT INTO Course_table (course_name,Time,teacher,class_time,Taccount) 
           		VALUES ("线性代数","2026-2027上","李四",40,"100002");
INSERT INTO Course_table (course_name,Time,teacher,class_time,Taccount) 
           		VALUES ("离散数学","2026-2027下","李四",40,"100002");
INSERT INTO Course_table (course_name,Time,teacher,class_time,Taccount) 
           		VALUES ("大学物理","2025-2026上","王五",32,"100003");
INSERT INTO Course_table (course_name,Time,teacher,class_time,Taccount) 
           		VALUES ("大学英语（1）","2025-2026上","韩梅梅",32,"100004");
INSERT INTO Course_table (course_name,Time,teacher,class_time,Taccount) 
           		VALUES ("大学英语（2）","2025-2026下","韩梅梅",32,"100004");
INSERT INTO Course_table (course_name,Time,teacher,class_time,Taccount) 
           		VALUES ("计算机类英语","2026-2027上","李明",64,"100005");
INSERT INTO Course_table (course_name,Time,teacher,class_time,Taccount) 
           		VALUES ("高等数学（2）","2025-2026下","张三",40,"100001");
           		
CREATE TABLE IF NOT EXISTS c_t (course_name VARCHAR(10) not null,teacher VARCHAR(10) not null,sex VARCHAR(1) not null,account VARCHAR(20) not null);
  		
           		