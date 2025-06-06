-- 1. Retrieve the names and contact details of all drivers with a rating of 4.5 or higher.
select firstname, lastname, phone from drivers where rating >= 4.5;

-- 2. Find the total number of rides completed by each driver.
select driverid, count(*) as total_rides from rides where ridestatus = 'Completed' group by driverid;

-- 3. List all riders who have never booked a ride.
select r.firstname, r.lastname from riders r left join rides rd on r.riderid = rd.riderid where rd.rideid is null;

-- 4. Calculate the total earnings of each driver from completed rides.
select driverid, sum(fare) as total_earnings from rides where ridestatus = 'Completed' group by driverid;

-- 5. Retrieve the most recent ride for each rider.
select riderid, max(ridedate) as latest_ride from rides group by riderid;

-- 6. Count the number of rides taken in each city.
select d.city, count(*) as total_rides from rides r join drivers d on r.driverid = d.driverid group by d.city;

-- 7. List all rides where the distance was greater than 20 km.
select * from rides where distance > 20;

-- 8. Identify the most preferred payment method.
select paymentmethod, count(*) as usage_count from payments group by paymentmethod order by usage_count desc limit 1;

-- 9. Find the top 3 highest-earning drivers.
select r.driverid, sum(r.fare) as total_earnings from rides r where r.ridestatus = 'Completed' group by r.driverid order by total_earnings desc limit 3;

-- 10. Retrieve details of all cancelled rides along with the rider's and driver's names.
select rd.rideid, rd.ridedate, rd.pickuplocation, rd.droplocation, r.firstname as rider_firstname, r.lastname as rider_lastname, d.firstname as driver_firstname, d.lastname as driver_lastname from rides rd join riders r on rd.riderid = r.riderid join drivers d on rd.driverid = d.driverid where rd.ridestatus = 'Cancelled';
