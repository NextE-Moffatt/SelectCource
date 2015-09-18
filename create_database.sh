mysql -u'root' -p'passwd' <<EOF

DROP DATABASE IF EXISTS student_manage;
CREATE DATABASE student_manage DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE student_manage;

CREATE TABLE user(
user_id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
school_num int(20) NOT NULL UNIQUE,
name varchar(50) NOT NULL,
sex varchar(10),
grade varchar(100),
school varchar(100),
major varchar(100),
class varchar(100),
qq varchar(20),
phone varchar(20),
email varchar(60) NOT NULL UNIQUE,
password varchar(120) NOT NULL,
adress varchar(200),
role int(2) NOT NULL DEFAULT '2' 
)CHARSET=utf8;

INSERT INTO user VALUES ('', '1234567890', 'admin', '', '', '', '', '', '', '', 'admin@qq.com', 'passwd', '', '0'); 
INSERT INTO user VALUES ('', '1234567', 'teacher1', '女', '', '机械工程学院', '', '', '', '', 'teacher1@qq.com', 'passwd', '', '1'); 
INSERT INTO user VALUES ('', '2234567', 'teacher2', '男', '', '材料学院', '', '', '', '', 'teacher2@qq.com', 'passwd', '', '1'); 
INSERT INTO user VALUES ('', '13110581072', 'ttop5', '男', '2013', '计算机科学与技术学院', '计算机科学与技术', '计科1302', '1427154738', '18753377101', 'ttop5@qq.com', 'passwd', '云南省昆明市石林县', '2');

CREATE TABLE notes(
notes_id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
title varchar(50) NOT NULL,
start_time date NOT NULL,
stop_time date NOT NULL,
description varchar(1000) NOT NULL
)CHARSET=utf8;

INSERT INTO notes VALUES ('', '关于全校大一同学的选课通知', '2015-09-16', '2015-09-17', '此次选课将持续一周的时间，共三次机会，请同学们按时限选课，完成应修的学分。注：大一的每学期最多选两门课！');

CREATE TABLE classroom(
classroom_id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
capacity  int(5) NOT NULL,
location varchar(10) NOT NULL
)CHARSET=utf8;

INSERT INTO classroom VALUES ('', '80', '3#101');
INSERT INTO classroom VALUES ('', '160', '3#206');
INSERT INTO classroom VALUES ('', '80', '4#101');
INSERT INTO classroom VALUES ('', '160', '5#206');

CREATE TABLE cource(
cource_id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
cource_name varchar(20) NOT NULL,
teacher int(11) NOT NULL,
classroom int(11) NOT NULL,
CONSTRAINT cource_teacher FOREIGN KEY (teacher) REFERENCES user(user_id),
CONSTRAINT cource_classroom FOREIGN KEY (classroom) REFERENCES classroom(classroom_id)
)CHARSET=utf8;

INSERT INTO cource VALUES('', '计算机网络', '2', '1');
INSERT INTO cource VALUES('', '佛教文化', '3', '2');
INSERT INTO cource VALUES('', '西方艺术鉴赏', '2', '3');
INSERT INTO cource VALUES('', '新能源技术', '3', '4');

CREATE TABLE scource(
scource_id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
student int(11) NOT NULL,
cource varchar(20) NOT NULL,
CONSTRAINT scource_student FOREIGN KEY (student) REFERENCES user(User_id)
)CHARSET=utf8;

INSERT INTO scource VALUES ('', '4', '1');
INSERT INTO scource VALUES ('', '4', '2');

CREATE TABLE score(
score_id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
student int(11) NOT NULL, 
cource int(11) NOT NULL, 
score varchar(5) NOT NULL,
CONSTRAINT score_student FOREIGN KEY (student) REFERENCES user(user_id),
CONSTRAINT score_cource FOREIGN KEY (cource) REFERENCES cource(cource_id)
)CHARSET=utf8;

INSERT INTO score VALUES('', '4', '1', '95');
INSERT INTO score VALUES('', '4', '2', '60');

EOF
