drop database enrollment_course;
create database enrollment_course;
use enrollment_course;

create table Student (
	student_id varchar(255) primary key,
    student_name varchar(255) not null,
    email varchar(255) unique,
    phone varchar(255) unique
);

create table Course (
	course_id varchar(255) primary key,
    course_name varchar(255) not null,
    credits int check (credits > 0)
);

create table Enrollment (
	student_id varchar(255),
    course_id varchar(255),
    gradle decimal(4,2) default 0,
    
    primary key(student_id, course_id),
    foreign key(student_id) references Student(student_id),
    foreign key(course_id) references Course(course_id)
);

insert into Student values
	('SV01', 'Nguyễn Văn A', '2003-05-10', 'a@gmail.com'),
    ('SV02', 'Trần Thị B', '2003-08-15', 'b@gmail.com'),
    ('SV03', 'Lê Văn C', '2002-11-20', 'c@gmail.com'),
    ('SV04', 'Phạm Thị D', '2003-02-12', 'd@gmail.com'),
    ('SV05', 'Hoàng Văn E', '2002-09-30', 'e@gmail.com');
    
insert into Course values
   ('C01', 'Cơ sở dữ liệu', 30),
   ('C02', 'Lập trình Java', 40),
   ('C03', 'Cấu trúc dữ liệu', 35),
   ('C04', 'Web cơ bản', 25),
   ('C05', 'Python cơ bản', 20);
   
insert into Enrollment values
   ('SV01', 'C01', 7),
   ('SV01', 'C02', 8),
   ('SV02', 'C03', 10),
   ('SV03', 'C03', 9),
   ('SV04', 'C04', 8);
   
update Enrollment
set gradle = 9
where student_id = 'SV02' and course_id = 'C03';

select student_name, email, phone from Student;

-- không thể xóa vì bảng enrollment ràng buộc với bảng course
delete from Course
where course_id = 'C01';
