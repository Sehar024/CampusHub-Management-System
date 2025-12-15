

             /*CampusHub Management System*/

  --create 9 tables 
create table departments(
  dept_id serial primary key,
  dept_name varchar(100) unique
);

create table students(
 st_id serial primary key,
 st_fname varchar(100),
 st_lname varchar(100),
 st_email varchar(150) unique,
 st_phone varchar(20),
 st_address varchar(100),
 st_admyear integer,
 dept_id integer,
 foreign key (dept_id) references departments(dept_id)
);

create table teachers(
 t_id serial primary key,
 dept_id integer,
 t_fname varchar(100),
 t_email varchar(150) unique,
 foreign key (dept_id) references departments(dept_id)
);

create table courses(
 c_id serial primary key,
 c_name varchar(100),
 c_credits integer,
 dept_id integer,
 t_id integer,
 foreign key (dept_id) references departments(dept_id),
 foreign key (t_id) references teachers(t_id)
);

create table enrollments(
 e_id serial primary key,
 st_id integer,
 c_id integer,
 e_semester varchar(20),
 e_grade varchar(5),
 foreign key (st_id) references students(st_id),
 foreign key (c_id) references courses(c_id)
);

create type attendance_status as enum('present','absent');
create table attendance(
 att_id serial primary key,
 st_id integer,
 c_id integer,
 att_date date not null,
 att_status  attendance_status,
 foreign key (st_id) references students(st_id),
 foreign key (c_id) references courses(c_id)
);

create table fees (
 f_id serial primary key,
 st_id integer,
 f_amount numeric(10,2),
 f_paidon date,
 foreign key (st_id) references students(st_id)
);

create table hostel(
 hr_id serial primary key,
 hr_no integer unique,
 hr_capacity integer
);

create table h_allocation(
 st_id integer,
 hr_id integer,
 all_on date,
 foreign key (st_id) references students(st_id),
 foreign key (hr_id) references hostel(hr_id)
);

  ---inserting values in all tables
insert into departments(dept_name) values
   ('IT'), ('SE'), ('BioTech'), ('PH'), ('Math');

insert into teachers(dept_id, t_fname, t_email) values
  (1, 'Ayesha', 'ayesha@example.com'), -- dept iT
  (1, 'Zainab', 'zainab@example.com'), --dept it
  (2, 'AzkaMir', 'azka@example.com'), ---dept SE
  (2, 'Attique-ur-rehman', 'attique.rehman@example.com'), --dept SE
  (3, 'UmarFarooq', 'umar.farooq@example.com'), --dept BT
  (4, 'Faryal', 'faryal@example.com'), --dept PH
  (5, 'Khurram', 'khurram@example.com'); --dept Math


INSERT INTO students (st_fname, st_lname, st_email, st_phone, st_address, st_admyear, dept_id) VALUES
('John', 'Smith', 'john.smith@example.com', '555-1001', '123 Maple St', 2021, 1),
('Emily', 'Johnson', 'emily.johnson@example.com', '555-1002', '45 Oak Avenue', 2022, 2),
('Michael', 'Brown', 'michael.brown@example.com', '555-1003', '78 Pine Road', 2020, 3),
('Sarah', 'Davis', 'sarah.davis@example.com', '555-1004', '9 Elm Street', 2021, 1),
('Daniel', 'Wilson', 'daniel.wilson@example.com', '555-1005', '67 Willow Dr', 2023, 2),
('Olivia', 'Taylor', 'olivia.taylor@example.com', '555-1006', '21 Cedar Lane', 2020, 4),
('James', 'Anderson', 'james.anderson@example.com', '555-1007', '56 Birch Blvd', 2019, 3),
('Sophia', 'Thomas', 'sophia.thomas@example.com', '555-1008', '89 Walnut St', 2022, 5),
('William', 'Jackson', 'william.jackson@example.com', '555-1009', '33 Poplar Ave', 2023, 1),
('Ava', 'White', 'ava.white@example.com', '555-1010', '14 Chestnut Rd', 2021, 4),
('Benjamin', 'Harris', 'benjamin.harris@example.com', '555-1011', '72 Hemlock St', 2020, 2),
('Mia', 'Martin', 'mia.martin@example.com', '555-1012', '5 Redwood Ct', 2019, 3),
('Elijah', 'Thompson', 'elijah.thompson@example.com', '555-1013', '90 Aspen Dr', 2022, 5),
('Isabella', 'Garcia', 'isabella.garcia@example.com', '555-1014', '12 Dogwood Ln', 2023, 1),
('Lucas', 'Martinez', 'lucas.martinez@example.com', '555-1015', '44 Spruce St', 2020, 4);


INSERT INTO courses (c_name, c_credits, dept_id, t_id) VALUES
('Introduction to Programming', 4, 1, 1), --IT & Ayesha
('Data Structures', 4, 1, 2), --IT & zainab
('Database Systems', 3, 2, 3), --SE & Azka Mir
('Calculus Mathematics', 3, 5, 7), -- Math & Khurram
('Linear Algebra', 4, 5, 7), --Math & Khurram
('Organic Chemistry', 4, 3, 5), --BT & UmarFarooq
('Physics I', 3, 4, 6), --PH & Faryal
('MicroBio', 3, 3, 5),  --BT & UmarFarooq
('Macroeconomics', 3, 4, 6), --PH & Faryal
('Software Engineering', 3, 2, 4); --SE & Attique-ur-rehman

INSERT INTO enrollments (st_id, c_id, e_semester, e_grade) VALUES
(1, 1, 'Fall 2023', 'A'),
(2, 2, 'Spring 2024', 'B+'),
(3, 3, 'Fall 2023', 'A-'),
(4, 1, 'Spring 2024', 'C'),
(5, 10, 'Fall 2022', 'A'),
(6, 7, 'Fall 2023', 'B-'),
(7, 6, 'Spring 2023', 'C+'),
(8, 4, 'Spring 2024', 'A'),
(9, 5, 'Fall 2023', 'B'),
(10, 8, 'Fall 2022', 'D+'),
(11, 9, 'Spring 2024', 'D'),
(12, 3, 'Fall 2023', 'B+'),
(13, 6, 'Spring 2024', 'F'),
(14, 2, 'Fall 2023', 'A-'),
(15, 10, 'Spring 2024', 'B');

INSERT INTO attendance (st_id, c_id, att_date, att_status) VALUES
(1, 1, '2024-01-10', 'present'),
(2, 2, '2024-01-10', 'absent'),
(3, 3, '2024-01-10', 'present'),
(4, 1, '2024-01-11', 'present'),
(5, 10, '2024-01-11', 'absent'),
(6, 7, '2024-01-12', 'present'),
(7, 6, '2024-01-12', 'present'),
(8, 4, '2024-01-12', 'absent'),
(9, 5, '2024-01-13', 'present'),
(10, 8, '2024-01-13', 'present'),
(11, 9, '2024-01-13', 'absent'),
(12, 3, '2024-01-14', 'present'),
(13, 6, '2024-01-14', 'present'),
(14, 2, '2024-01-14', 'absent'),
(15, 10, '2024-01-15', 'present');

select * from  attendance;

INSERT INTO fees (st_id, f_amount, f_paidon) VALUES
(1, 25000.00, '2024-01-05'),
(2, 26000.00, '2024-01-06'),
(3, 27000.00, '2024-01-06'),
(4, 25000.00, '2024-01-07'),
(5, 26000.00, '2024-01-07'),
(6, 28000.00, '2024-01-08'),
(7, 27000.00, '2024-01-08'),
(8, 30000.00, '2024-01-09'),
(9, 25000.00, '2024-01-10'),
(10, 28000.00, '2024-01-10'),
(11, 26000.00, '2024-01-11'),
(12, 27000.00, '2024-01-11'),
(13, 30000.00, '2024-01-12'),
(14, 25000.00, '2024-01-12'),
(15, 28000.00, '2024-01-13');



INSERT INTO hostel (hr_no, hr_capacity) VALUES
(101, 3),
(102, 2),
(103, 4),
(104, 3),
(105, 2),
(106, 1),
(107, 3),
(108, 4),
(109, 2),
(110, 3);

INSERT INTO h_allocation (st_id, hr_id, all_on) VALUES
(1, 1, '2024-01-05'),
(2, 2, '2024-01-06'),
(3, 3, '2024-01-06'),
(4, 4, '2024-01-07'),
(5, 5, '2024-01-07'),
(6, 6, '2024-01-08'),
(7, 7, '2024-01-08'),
(8, 8, '2024-01-09'),
(9, 9, '2024-01-10'),
(10, 10, '2024-01-10'),
(11, 1, '2024-01-11'),
(12, 2, '2024-01-11'),
(13, 3, '2024-01-12'),
(14, 4, '2024-01-12'),
(15, 5, '2024-01-13');

	/*basic sql*/
delete from enrollments where e_id=13;
select * from enrollments;

   /*Joins*/
   --student with dept name
select s.st_fname, d.dept_name from students s 
     join departments d on s.dept_id=d.dept_id;
     --courses with teacher name
select c.c_name, t.t_fname from courses c join teachers t
    on c.t_id=t.t_id;

   -- which students enroll which courses
 select s.st_fname, c.c_name from enrollments e join students s
   on e.st_id=s.st_id join courses c
   on e.c_id=c.c_id;


   /*aggregation*/
   
  --student count per dept
select 
    d.dept_name, 
   count(s.st_id)
  from departments d
     join students s on s.dept_id=d.dept_id
	 group by d.dept_name;

   ---avg per course
SELECT 
    c.c_id,
    c.c_name,
    AVG(
        CASE e.e_grade
            WHEN 'A+' THEN 4
			WHEN 'A-' THEN 3.7
			WHEN 'A' THEN 3.3
			WHEN 'B+' THEN 3
            WHEN 'B-' THEN 2.7
			WHEN 'B' THEN 2.5
            WHEN 'C+' THEN 2.3
			WHEN 'C-' THEN 2
            WHEN 'C' THEN 1
			WHEN 'D+' THEN 1.8
			WHEN 'D-' THEN 1.4
            WHEN 'F' THEN 0
        END
    ) AS avg_grade_numeric
FROM courses c
JOIN enrollments e
    ON c.c_id = e.c_id
GROUP BY c.c_id, c.c_name
ORDER BY c.c_id;

   ---count att per std

   SELECT -- p & a count
    a.att_status,
    COUNT(*) 
FROM attendance a
GROUP BY a.att_status;


SELECT --- each student att count
    s.st_id,
    s.st_fname,
    COUNT(a.att_id) AS total_attendance
FROM students s
JOIN attendance a
    ON s.st_id = a.st_id
GROUP BY s.st_id, s.st_fname
ORDER BY s.st_id;

   /*subqueries*/

   ---students that not paid fee
 SELECT *
FROM students
WHERE st_id NOT IN (
    SELECT st_id FROM fees
);


 ---list teachers in SE dept 
SELECT t.t_fname, d.dept_name FROM teachers t join
    departments d on t.dept_id=d.dept_id
	where d.dept_name='SE';

 ---students live in hostelroom that are full

select s.st_fname, h.hr_no, ha.all_on from h_allocation ha --- std room no
   join hostel h on h.hr_id=ha.hr_id
   join students s on s.st_id=ha.st_id;

SELECT s.st_fname, h.hr_no, ha.all_on, ---room or full or not that all
    CASE 
        WHEN room_counts.total_students >= h.hr_capacity THEN 'Full'
        ELSE 'Not Full'
    END AS room_status
FROM h_allocation ha
JOIN hostel h ON h.hr_id = ha.hr_id
JOIN students s ON s.st_id = ha.st_id
JOIN (
    SELECT hr_id, COUNT(*) AS total_students
    FROM h_allocation
    GROUP BY hr_id
) room_counts ON room_counts.hr_id = h.hr_id;

                /*Views*/
  --student  overview
create view st_overview as
select s.st_fname, c.c_name, e.e_semester
  from enrollments e 
  join students s on e.st_id=s.st_id
  join courses c on c.c_id=e.c_id;

select * from st_overview;

  --department course count
create view dept_crs_count as
SELECT 
    d.dept_name,
    COUNT(c.c_id) AS course_count
FROM departments d
LEFT JOIN courses c
    ON d.dept_id = c.dept_id
GROUP BY d.dept_name
ORDER BY course_count DESC;

select * from dept_crs_count;

  ---att percentage of students
create view Satt_perentage as
SELECT 
    att.att_status,
    COUNT(s.st_id) AS att_count,
    ROUND(
        COUNT(s.st_id) * 100.0 / SUM(COUNT(s.st_id)) OVER (), 
        2
    ) AS att_percentage
FROM attendance att
JOIN students s ON s.st_id = att.st_id
GROUP BY att.att_status;

select * from Satt_perentage;

      /*Functions*/
	  
CREATE OR REPLACE FUNCTION cal_gpa(p_st_id INT)
RETURNS NUMERIC(4,2)
AS $$
BEGIN
    RETURN (
        SELECT ROUND(
            AVG(
                CASE e_grade
                    WHEN 'A+' THEN 4.0
                    WHEN 'A'  THEN 3.7
                    WHEN 'A-' THEN 3.3
                    WHEN 'B+' THEN 3.0
                    WHEN 'B'  THEN 2.7
                    WHEN 'B-' THEN 2.5
                    WHEN 'C+' THEN 2.3
                    WHEN 'C'  THEN 2.0
                    WHEN 'C-' THEN 1.7
                    WHEN 'D+' THEN 1.3
                    WHEN 'D'  THEN 1.0
                    WHEN 'D-' THEN 0.7
                    ELSE 0
                END
            ), 2
        )
        FROM enrollments
        WHERE st_id = p_st_id
    );
END;
$$ LANGUAGE plpgsql;

select * from cal_gpa(9);

    /*triggers*/

---update total credits when grade assigned
ALTER TABLE students
ADD COLUMN total_credits INT DEFAULT 0;


CREATE OR REPLACE FUNCTION update_credits()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE students
    SET total_credits = total_credits + (
        SELECT c_credits
        FROM courses
        WHERE c_id = NEW.c_id
    )
    WHERE st_id = NEW.st_id;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_credits
AFTER UPDATE OF e_grade ON enrollments
FOR EACH ROW
WHEN (NEW.e_grade IS NOT NULL)
EXECUTE FUNCTION update_credits();


UPDATE enrollments
SET e_grade = 'A'
WHERE e_id = 1;

SELECT st_id, total_credits
FROM students
WHERE st_id = 1;


---prevent att on weekend

CREATE OR REPLACE FUNCTION pre_weekend_att()
RETURNS TRIGGER AS $$
BEGIN
    IF EXTRACT(DOW FROM NEW.att_date) IN (0, 6) THEN
        RAISE EXCEPTION 'Attendance not allowed on weekends';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_no_weekend
BEFORE INSERT ON attendance
FOR EACH ROW
EXECUTE FUNCTION pre_weekend_att();

INSERT INTO attendance (st_id, c_id, att_date, att_status)
VALUES (1, 1, '2025-12-14', 'present'); -- when insert att on weekend than show error

 select * from attendance;
 

   ---log fee changes
 create table fee_logs(
   l_id serial primary key,
   fee_id int,
   old_amount numeric(10, 2),
   new_amount numeric(10,2),
   changed_on timestamp default now()  
 );

 CREATE OR REPLACE FUNCTION log_fee_update()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO fee_logs (fee_id, old_amount, new_amount)
    VALUES (OLD.f_id, OLD.f_amount, NEW.f_amount);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_fee_log
AFTER UPDATE OF f_amount ON fees
FOR EACH ROW
EXECUTE FUNCTION log_fee_update();

UPDATE fees SET f_amount = 62000 WHERE f_id = 2;

select * from fee_logs;

               /*End Project*/



	
