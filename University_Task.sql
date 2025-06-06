-- 1. Find the total number of students in each department.
select department_id, count(*) as total_students from students group by department_id;

-- 2. List all courses taught by a specific professor.
select course_name from courses where professor_id = [professor_id];

-- 3. Find the average grade of students in each course.
select course_id, avg(cast(grade as float)) as average_grade from enrollments group by course_id;

-- 4. List all students who have not enrolled in any courses.
select s.first_name, s.last_name from students s left join enrollments e on s.student_id = e.student_id where e.enrollment_id is null;

-- 5. Find the number of courses offered by each department.
select department_id, count(*) as total_courses from courses group by department_id;

-- 6. List all students who have taken a specific course (e.g., 'Database Systems').
select s.first_name, s.last_name from students s join enrollments e on s.student_id = e.student_id join courses c on e.course_id = c.course_id where c.course_name = 'Database Systems';

-- 7. Find the most popular course based on enrollment numbers.
select course_id, count(*) as enrollments from enrollments group by course_id order by enrollments desc limit 1;

-- 8. Find the average number of credits per student in a department.
select s.department_id, avg(c.credits) as average_credits from students s join enrollments e on s.student_id = e.student_id join courses c on e.course_id = c.course_id group by s.department_id;

-- 9. List all professors who teach in more than one department.
select professor_id from courses group by professor_id having count(distinct department_id) > 1;

-- 10. Get the highest and lowest grade in a specific course (e.g., 'Operating Systems').
select max(grade) as highest_grade, min(grade) as lowest_grade from enrollments e join courses c on e.course_id = c.course_id where c.course_name = 'Operating Systems';
