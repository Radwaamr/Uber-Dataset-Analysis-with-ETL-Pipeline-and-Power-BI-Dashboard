CREATE DATABASE Uber_DW;
USE Uber_DW;

CREATE TABLE dropoff_datetime_dim (
    drop_datetime_id INT PRIMARY KEY,
    tpep_dropoff_datetime DATETIME,
    drop_hour INT,
    drop_day INT,
    drop_month INT,
    drop_year INT,
    drop_weekday INT
);

CREATE TABLE pickup_datetime_dim (
    pick_datetime_id INT PRIMARY KEY,
    tpep_pickup_datetime DATETIME,
    pick_hour INT,
    pick_day INT,
    pick_month INT,
    pick_year INT,
    pick_weekday INT
);


CREATE TABLE rate_code_dim (
    rate_code_id INT PRIMARY KEY,       
    RatecodeID INT,                     
    rate_code_name VARCHAR(255)         
);

CREATE TABLE pickup_location_dim (
    pickup_location_id INT PRIMARY KEY,       
    pickup_longitude FLOAT,               
    pickup_latitude FLOAT                     
);


CREATE TABLE dropoff_location_dim (
    dropoff_location_id INT PRIMARY KEY,       
    dropoff_longitude FLOAT,               
    dropoff_latitude FLOAT                     
);


CREATE TABLE payment_type_dim (
    payment_type_id INT PRIMARY KEY,        
    payment_type INT,                      
    payment_type_name VARCHAR(255)          
);


CREATE TABLE fact_table (
    trip_id INT PRIMARY KEY,                  
    VendorID INT,                             
    rate_code_id INT,                         
    pickup_location_id INT,                   
    dropoff_location_id INT,                 
    pick_datetime_id INT,                     
    drop_datetime_id INT,                     
    payment_type_id INT,                      
    passenger_count INT,                      
    trip_distance FLOAT,                      
    fare_amount FLOAT,                        
    extra FLOAT,                              
    mta_tax FLOAT,                            
    tip_amount FLOAT,                         
    tolls_amount FLOAT,                       
    improvement_surcharge FLOAT,              
    total_amount FLOAT,
	FOREIGN KEY(rate_code_id) REFERENCES rate_code_dim(rate_code_id),
	FOREIGN KEY(pickup_location_id) REFERENCES pickup_location_dim(pickup_location_id),
	FOREIGN KEY(dropoff_location_id) REFERENCES dropoff_location_dim(dropoff_location_id),
	FOREIGN KEY(pick_datetime_id) REFERENCES pickup_datetime_dim(pick_datetime_id),
	FOREIGN KEY(drop_datetime_id) REFERENCES dropoff_datetime_dim(drop_datetime_id),
	FOREIGN KEY(payment_type_id) REFERENCES payment_type_dim(payment_type_id)
);


