-- 1. Find the Total Number of Bookings for Each Flight
select flight_id, count(*) as total_bookings from bookings group by flight_id;

-- 2. List All Passengers Who Have Booked a Specific Flight (e.g., Flight Number 'AI202')
select p.first_name, p.last_name from passengers p join bookings b on p.passenger_id = b.passenger_id join flights f on b.flight_id = f.flight_id where f.flight_number = 'AI202';

-- 3. Find the Total Number of Flights Departing from a Specific Airport (e.g., 'JFK')
select count(*) as total_flights from flights f join airports a on f.departure_airport_id = a.airport_id where a.airport_name = 'JFK';

-- 4. Find the Flight with the Most Passengers Booked (Most Popular Flight)
select flight_id, count(*) as total_passengers from bookings group by flight_id order by total_passengers desc limit 1;

-- 5. Get the Total Payment Amount for All Confirmed Bookings
select sum(p.amount) as total_confirmed_payments from payments p join bookings b on p.booking_id = b.booking_id where b.status = 'Confirmed';

-- 6. List All Flights Departing After a Specific Date and Time (e.g., '2024-06-01 10:00:00')
select * from flights where departure_time > '2024-06-01 10:00:00';

-- 7. Find the Number of Bookings Made in Each Seat Class (e.g., Economy, Business)
select seat_class, count(*) as total_bookings from bookings group by seat_class;

-- 8. List All Flights That Have Been Cancelled
select * from flights where status = 'Cancelled';

-- 9. Find the Average Payment Amount for Confirmed Bookings
select avg(p.amount) as average_payment from payments p join bookings b on p.booking_id = b.booking_id where b.status = 'Confirmed';

-- 10. Get the Total Number of Bookings and Total Payment Amount for Each Passenger
select p.passenger_id, p.first_name, p.last_name, count(b.booking_id) as total_bookings, sum(pay.amount) as total_payment from passengers p join bookings b on p.passenger_id = b.passenger_id join payments pay on b.booking_id = pay.booking_id group by p.passenger_id, p.first_name, p.last_name;
