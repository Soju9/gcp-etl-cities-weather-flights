CREATE DATABASE cities_info;

USE cities_info;

CREATE TABLE city (
city_id INT auto_increment,
city_name VARCHAR(255) NOT NULL,
country VARCHAR(255) NOT NULL,
longitude FLOAT,
latitude FLOAT,
PRIMARY KEY (city_id)
);

SELECT * FROM city;

CREATE TABLE population (
population_size INT,
timestamp_population YEAR,
city_id INT,
FOREIGN KEY (city_id) REFERENCES city(city_id)
);


SELECT * FROM population;


CREATE TABLE weather (
date DATE,
time TIME,
temperature_C FLOAT,
feels_like_C FLOAT,
min_temp_C FLOAT,
max_temp_C FLOAT,
rain_probability_perc INT,
humidity_perc INT,
weather VARCHAR(50) NOT NULL,
wind_speed FLOAT,
data_retrieved_at DATE,
city_id INT,
FOREIGN KEY (city_id) REFERENCES city(city_id)
);

SELECT * FROM weather;

CREATE TABLE airport (
iata VARCHAR(10),
icao VARCHAR (10),
airport_name VARCHAR(50),
city VARCHAR(50),
country VARCHAR(5),
latitude FLOAT,
longitude FLOAT,
city_id INT,
PRIMARY KEY (iata),
FOREIGN KEY (city_id) REFERENCES city(city_id)
);

SELECT * FROM airport;

CREATE Table flights (
flights_id INT auto_increment,
flight_num VARCHAR(50) NOT NULL,
arrival_time DATETIME,
arrival_terminal VARCHAR(10),
departure_iata VARCHAR(50),
arrival_iata VARCHAR(50),
PRIMARY KEY (flights_id),
FOREIGN KEY (arrival_iata) REFERENCES airport(iata)
);

SELECT * FROM flights;

SELECT *
FROM city
JOIN population
USING (city_id)
JOIN weather
USING (city_id)
JOIN airport
USING (city_id)
JOIN flights
WHERE airport.iata = flights.arrival_iata;
