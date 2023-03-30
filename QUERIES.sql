select * from student;
select * from punishment;
select * from violation;
select * from dc_member;
select * from serves;
select * from participates;
select * from hearing;
select * from decision;
select * from commits;

/* Display the names of students who are serving academic suspension */

select * from student s,serves se where s.SAP_ID=se.SAP_ID and se.punishment_code="AS01";

/* Display the names of the students who were caught with alcohol */

select s.student_fullname from student s,commits c,violation v where s.SAP_ID=c.SAP_ID and c.violation_code=v.violation_code and v.violation_cateory="ALCOHOL";

/* Display contact numbers of parents of students who were caught ragging on campus */
select s.father_phonenumber,s.mother_phonenumber from student s,commits c,violation v where s.SAP_ID=c.SAP_ID and c.violation_code=v.violation_code and v.violation_cateory="RAGGING";

/* Display the violation commited and punishment served by Vansh Ajit Julka */

select violation_cateory,punishment_category from violation v,student s,commits c,punishment p,serves se where s.SAP_ID=c.SAP_ID and s.SAP_ID=se.SAP_ID and c.violation_code=v.violation_code and se.punishment_code=p.punishment_code and s.student_fullname="vansh Ajit Julka";

/* Display the details of students caught in pda */

select * from student s,commits c, violation v where s.SAP_ID=c.SAP_ID and c.violation_code=v.violation_code and v.violation_cateory="PDA";

/* display the name of the faculty monitoring the punishment given to Aaryan Anand Dhorey */

select punishment_co_ordinator from punishment p,student s,serves se where s.SAP_ID=se.SAP_ID and se.punishment_code=p.punishment_code and s.student_fullname="Aaryan Anand Dhorey";

/* Display the number of members in the Discipline commitee */

select count(member_id) from dc_member;

/* display the hearing report url where from the hearing of Irbaaz Ahmed Patel */

select hearing_report_pdf_url from hearing h,participates p,student s where s.SAP_ID=p.SAP_ID and p.hearing_id=h.hearing_id and s.student_fullname="Irbaaz Ahmed Patel";

/* Display the number of students whose witness was a warden */

select count(p.SAP_ID) from student s,hearing h,participates p WHERE s.SAP_ID=p.SAP_ID AND p.hearing_id=h.hearing_id and h.witness="warden";

/* Every SAP_ID shoul be unique. Add a constraint. */

alter table student add constraint uniqueness unique (SAP_ID);

/* add a new column of the duration for which a punishment is served in the table serves. */

alter table serves add column punishment_duration varchar(20);
select * from serves;

/* drop the column punishment duration from table serves. */

alter table serves drop column punishment_duration;
select * from serves;

/* create a view to display student name,sap id, violation committed and punishment served. */

create view dc_details as select student_fullname,s.SAP_ID,v.violation_cateory,p.punishment_category from student s,commits c, serves se, punishment p,violation v where s.SAP_ID=c.SAP_ID and s.SAP_ID=se.SAP_ID and c.violation_code=v.violation_code and se.punishment_code=p.punishment_code;
select * from dc_details;

/* update the phone number of Vansh Julka to 8779790683 */
update student set student_phonenumber="8779790683" where student_fullname="vansh Ajit Julka";
select student_phonenumber from student where student_fullname="vansh Ajit Julka";

/* display the details of students who were caught smoking or with alcohol */

select * from student s,commits c,violation v where s.SAP_ID=c.SAP_ID and c.violation_code=v.violation_code and v.violation_cateory="ALCOHOL" union select * from student s,commits c,violation v where s.SAP_ID=c.SAP_ID and c.violation_code=v.violation_code and v.violation_cateory="SMOKING";

commit;
