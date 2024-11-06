--the total number of trips
SELECT COUNT(trip_id) AS total_trips
FROM fact_table


--the average fare amount for each vendor
SELECT VendorID,AVG(fare_amount) 
FROM fact_table
GROUP BY VendorID

--the total fare amount for each vendor
SELECT VendorID,SUM(fare_amount) 
FROM fact_table
GROUP BY VendorID

--the average tip based on payment type
SELECT p.payment_type_name,AVG(f.tip_amount) 
FROM fact_table f
JOIN payment_type_dim p
ON F.payment_type_id=p.payment_type_id
GROUP BY p.payment_type_name


--the top 10 pickup locations based on the number of trips
SELECT TOP 10 p.pickup_location_id,COUNT(f.trip_id) AS num_of_trips
FROM fact_table f
JOIN pickup_location_dim p
ON f.pickup_location_id=p.pickup_location_id
GROUP BY p.pickup_location_id
ORDER BY num_of_trips DESC


--the total number of trips by passenger count
SELECT passenger_count,COUNT(trip_id) AS total_trips
FROM fact_table
GROUP BY passenger_count


--the average fare amount by hour of the day based on pickup datetime
SELECT p.pick_hour AS hour_of_day, AVG(f.fare_amount) AS avg_fare_amount
FROM fact_table f
JOIN pickup_datetime_dim p
ON f.pick_datetime_id=p.pick_datetime_id
GROUP BY p.pick_hour
ORDER BY p.pick_hour

--the average fare amount by hour of the day based on dropoff datetime
SELECT d.drop_hour AS hour_of_day, AVG(f.fare_amount) AS avg_fare_amount
FROM fact_table f
JOIN dropoff_datetime_dim d
ON f.drop_datetime_id=d.drop_datetime_id
GROUP BY d.drop_hour
ORDER BY d.drop_hour


--the total fare amount for each pickup location
SELECT p.pickup_location_id,SUM(f.fare_amount) AS total_fare_amount
FROM fact_table f
JOIN pickup_location_dim p
ON f.pickup_location_id=p.pickup_location_id
GROUP BY p.pickup_location_id
ORDER BY total_fare_amount DESC

--the total number of trips for each hour of the day, based on pickup datetime
SELECT p.pick_hour,COUNT(f.trip_id) AS trip_count
FROM fact_table f
JOIN pickup_datetime_dim p
ON f.pick_datetime_id=p.pick_datetime_id
GROUP BY p.pick_hour
ORDER BY p.pick_hour


--the average trip distance for each pickup location
SELECT p.pickup_location_id,AVG(F.trip_distance) AS avg_trip_distance
FROM fact_table f 
JOIN pickup_location_dim p
ON f.pickup_location_id=p.pickup_location_id
GROUP BY p.pickup_location_id
ORDER BY avg_trip_distance DESC


--the total fare amount for each day of the week based on pickup datetime
SELECT p.pick_weekday,SUM(f.fare_amount) AS total_fare_Amount
FROM fact_table f
JOIN pickup_datetime_dim p
ON f.pick_datetime_id=p.pick_datetime_id
GROUP BY p.pick_weekday
ORDER BY total_fare_Amount DESC


--the total number of trips for each payment type
SELECT p.payment_type_name,COUNT(f.trip_id) AS num_of_trips
FROM fact_table f
JOIN payment_type_dim p
ON f.payment_type_id=p.payment_type_id
GROUP BY p.payment_type_name
ORDER BY num_of_trips DESC



--the longest trip distance, based on the trip_distance
SELECT TOP 1 trip_id,trip_distance
FROM fact_table 
ORDER BY trip_distance DESC


--the total fare amount for each rate code (e.g., Standard rate, JFK, etc.)
SELECT r.rate_code_name,SUM(f.fare_amount) AS total_fare_amount
FROM fact_table f
JOIN rate_code_dim r
ON f.rate_code_id=r.rate_code_id
GROUP BY r.rate_code_name
ORDER BY total_fare_amount DESC


--the average trip duration (from pickup to dropoff) for each pickup location
SELECT pl.pickup_location_id,AVG(DATEDIFF(MINUTE,pd.tpep_pickup_datetime,dd.tpep_dropoff_datetime)) AS avg_trip_duration_minutes
FROM fact_table f
JOIN pickup_location_dim pl
ON f.pickup_location_id=pl.pickup_location_id
JOIN pickup_datetime_dim pd 
ON f.pick_datetime_id=pd.pick_datetime_id
JOIN dropoff_datetime_dim dd
ON f.drop_datetime_id=dd.drop_datetime_id
GROUP BY pl.pickup_location_id
ORDER BY avg_trip_duration_minutes DESC


-- the total distance traveled for each pickup location
SELECT p.pickup_location_id, SUM(trip_distance) AS total_dist_traveled
FROM fact_table f
JOIN pickup_location_dim p
ON f.pickup_location_id=p.pickup_location_id
GROUP BY p.pickup_location_id
ORDER BY total_dist_traveled DESC


--the top 5 most expensive trips
SELECT TOP 5 trip_id,fare_amount
FROM fact_table 
ORDER BY fare_amount DESC


--the average number of passengers by payment type
SELECT p.payment_type_name,AVG(f.passenger_count) AS avg_num_of_passengers
FROM fact_table f
JOIN payment_type_dim p
ON f.payment_type_id=p.payment_type_id
GROUP BY p.payment_type_name
ORDER BY avg_num_of_passengers DESC
