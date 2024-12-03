
# College Discipline Committee DBMS

Welcome to the **College Discipline Committee DBMS** project! This repository contains the implementation of a Database Management System (DBMS) for managing and maintaining records of disciplinary actions within a college setting. The system allows easy management of student discipline cases, helping college authorities efficiently track, review, and resolve issues.

## 📋 Project Overview

The College Discipline Committee DBMS aims to streamline the management of disciplinary actions taken against students. It provides a structured, organized way for college authorities to store, retrieve, and update records related to student behavior, disciplinary hearings, and actions taken.


## 🚀 Getting Started


### Example SQL Queries

Here are some sample SQL queries that can be used within the system:

- **View all students**:
    ```sql
    SELECT * FROM students;
    ```

- **View disciplinary cases of a specific student**:
    ```sql
    SELECT * FROM cases WHERE student_id = 'S123';
    ```

- **Generate a report of all students with violations**:
    ```sql
    SELECT name, student_id, violation, action_taken
    FROM students
    JOIN cases ON students.student_id = cases.student_id
    WHERE action_taken IS NOT NULL;
    ```

## 📊 Database Design

The database structure for this project is designed to handle disciplinary records efficiently. The system consists of the following main tables:

1. **STUDENT**: Stores student information.
   - `student_id` (Primary Key)
   - `name`
   - `course`
   - `year_of_study`
   
2. **VIOLATION**: Details of violations committed by students.
   - `violation_id` (Primary Key)
   - `violation_type`
   - `description`

3. **HEARING**: Tracks disciplinary hearings.
   - `hearing_id` (Primary Key)
   - `student_id` (Foreign Key)
   - `violation_id` (Foreign Key)
   - `date`
   - `decision`

4. **PUNISHMENT**: Defines possible punishments for violations.
   - `punishment_id` (Primary Key)
   - `punishment_type`
   - `description`

5. **DECISION**: Stores decisions taken during hearings.
   - `decision_id` (Primary Key)
   - `hearing_id` (Foreign Key)
   - `punishment_id` (Foreign Key)
   - `date_of_decision`

6. **PARTICIPATES**: Records committee member participation in hearings.
   - `hearing_id` (Foreign Key)
   - `dc_member_id` (Foreign Key)
   
7. **SERVES**: Tracks which students are serving punishments.
   - `student_id` (Foreign Key)
   - `punishment_id` (Foreign Key)
   - `start_date`
   - `end_date`

8. **DC_MEMBER**: Stores details of the Discipline Committee members.
   - `dc_member_id` (Primary Key)
   - `name`
   - `role`

## 👥 Authors

- [Vansh Julka](https://github.com/vanshjulka18)
