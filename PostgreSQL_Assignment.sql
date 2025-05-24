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
('Carol King', 'Mountain Range');


INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');



INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);


-- show all tables data 

SELECT * FROM rangers;
SELECT * FROM species;
SELECT * FROM sightings;



-- let's start problem solving 



-- Problem: - 01
INSERT INTO rangers (name, region) VALUES
('Derek Fox', 'Coastal Plains');



-- Problem: - 02

SELECT COUNT(*)  AS unique_species_count FROM species
    GROUP BY species_id;
--  Count unique species ever sighted.




-- Problem: - 03
SELECT * FROM sightings 
    WHERE location LIKE '%Pass%';



-- Problem: - 04
SELECT name, COUNT(*) AS total_sightings FROM sightings
    JOIN rangers ON sightings.ranger_id = rangers.ranger_id
    GROUP BY name
    ORDER BY total_sightings DESC;






-- Problem: - 05
