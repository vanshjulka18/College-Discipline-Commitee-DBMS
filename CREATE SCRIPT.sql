show databases;
use project;
create table student(
student_fullname varchar(40),
email_id varchar(30),
SAP_ID varchar(11),
academic_year int,
branch varchar(50), 
student_phonenumber varchar(10),
 father_phonenumber varchar(10), 
 father_email_id varchar(40),
 mother_phonenumber varchar(10), 
 mother_email_id varchar(40),
 mentor_name varchar(20),
 primary key (SAP_ID)
 );
create table punishment(
punishment_code varchar(10),
punishment_duration varchar(10),
punishment_category varchar(20),
punishment_co_ordinator varchar(30),
primary key(punishment_code)
);

create table violation(
violation_code int(4),
violation_date date,
violation_time time,
busting_place varchar(20),
violation_cateory varchar(20),
primary key(violation_code)
);

create table hearing(
hearing_id int,
hearing_date date,
hearing_time time,
hearing_report_pdf_url longtext,
faculty_co_ordinator varchar(20),
hostel_co_ordinator varchar(20),
witness varchar(20),
statement longtext,
primary key(hearing_id)
);

create table dc_member(
member_id int,
member_name varchar(20),
member_designation varchar(30),
member_phonenumber varchar(20),
member_email_id varchar(40),
primary key(member_id)
);

create table serves(

SAP_ID varchar(11),
punishment_code varchar(10),
foreign key(SAP_ID) references student(SAP_ID),
foreign key(punishment_code) references punishment(punishment_code)

);

create table commits(

SAP_ID varchar(11),
violation_code int(4),
FOREIGN KEY(SAP_ID) references student(SAP_ID),
foreign key (violation_code) references violation(violation_code)


);

create table decision(

SAP_ID varchar(11),
hearing_id int,
punishment_code varchar(10),
FOREIGN KEY(SAP_ID) references student(SAP_ID),
foreign key(punishment_code) references punishment(punishment_code),
foreign key(hearing_id) references hearing(hearing_id)
);

create table participates(
member_id int,
hearing_id int,
SAP_ID varchar(11),
FOREIGN KEY(SAP_ID) references student(SAP_ID),
foreign key(punishment_code) references punishment(punishment_code),
foreign key(member_id) references dc_member(member_id)
);

commit;





