-- 1. Find the Total Number of Appointments for Each Doctor

select doctor_id, count(*) as total_appointments from appointments group by doctor_id;


-- 2. List All Patients Who Have an Appointment with a Specific Doctor (e.g., Dr. John Smith)

select p.first_name, p.last_name from patients p join appointments a on p.patient_id = a.patient_id join doctors d on a.doctor_id = d.doctor_id where d.first_name = 'John' and d.last_name = 'Smith';


-- 3. Find the Number of Appointments Scheduled in a Specific Department

select d.department_name, count(*) as appointment_count from appointments a join doctors doc on a.doctor_id = doc.doctor_id join departments d on doc.department_id = d.department_id where d.department_name = 'Cardiology' group by d.department_name;



-- 4. Find the Most Popular Specialty Based on Number of Appointments

select s.specialty_name, count(*) as appointment_count from appointments a join doctors d on a.doctor_id = d.doctor_id join specialties s on d.specialty_id = s.specialty_id group by s.specialty_name order by appointment_count desc limit 1;



-- 5. Get the Total Payment Amount for All Completed Appointments

select sum(p.payment_amount) as total_completed_payments from payments p join appointments a on p.appointment_id = a.appointment_id where a.status = 'Completed';



-- 6. Find the Number of Patients Seen by Each Doctor

select doctor_id, count(distinct patient_id) as patients_seen from appointments group by doctor_id;



-- 7. List All Patients Who Have Missed Their Appointments (Status 'Cancelled')

select p.first_name, p.last_name from patients p join appointments a on p.patient_id = a.patient_id where a.status = 'Cancelled';



-- 8. Find the Total Number of Appointments for Each Status (Scheduled, Completed, Cancelled)

select status, count(*) as total from appointments group by status;



-- 9. Get the Average Payment Amount for Completed Appointments

select avg(p.payment_amount) as avg_payment from payments p join appointments a on p.appointment_id = a.appointment_id where a.status = 'Completed';



-- 10. Find the Doctor with the Highest Number of Appointments

select doctor_id, count(*) as total from appointments group by doctor_id order by total desc limit 1;
