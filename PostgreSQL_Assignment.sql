-- Active: 1747540978742@@127.0.0.1@5432@conservation_db


-- Create a new PostgreSQL database named "conservation_db"
CREATE DATABASE "conservation_db";


-- create three tables: rangers, species and sightings

CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region TEXT NOT NULL
)


CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(100) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(50) NOT NULL
);


CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT REFERENCES rangers(ranger_id),
    species_id INT REFERENCES species(species_id),
    sighting_time TIMESTAMP NOT NULL,
    location TEXT NOT NULL,
    notes TEXT
);


-- Insert sample data into the all tables  

INSERT INTO rangers (name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range'),
('Ashraful', 'Forest Edge');



INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');



INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL),
(2, NULL, 'Elephant Valley', '2024-05-20 11:00:00', 'Herd of elephants spotted');


-- show all tables data 

SELECT * FROM rangers;
SELECT * FROM species;
SELECT * FROM sightings;



-- let's start problem solving 



-- Problem: - 01
INSERT INTO rangers (name, region) VALUES
('Derek Fox', 'Coastal Plains');



-- Problem: - 02
SELECT COUNT(*) AS unique_species_count FROM species
    WHERE conservation_status = 'Endangered';



-- Problem: - 03
SELECT * FROM sightings 
    WHERE location LIKE '%Pass%';



-- Problem: - 04
SELECT name, COUNT(*) AS total_sightings FROM sightings
    JOIN rangers USING (ranger_id)
    GROUP BY name
    ORDER BY total_sightings DESC;



-- Problem: - 05
SELECT common_name FROM species
    WHERE species_id NOT IN (
        SELECT species_id FROM sightings
    );



-- Problem: - 06
SELECT common_name, sighting_time, name FROM sightings
    JOIN rangers USING (ranger_id) 
    JOIN species USING (species_id)
    ORDER BY sighting_time DESC LIMIT 2;



-- Problem: - 07
UPDATE species 
    SET conservation_status = 'Historic'
    WHERE discovery_date < '1800-01-01';



-- Problem: - 08
SELECT sighting_id,CASE
    WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
    END AS time_of_day
FROM sightings;



-- Problem: - 09
DELETE FROM rangers
    WHERE ranger_id NOT IN (
    SELECT ranger_id FROM sightings
        WHERE ranger_id IS NOT NULL
    );


