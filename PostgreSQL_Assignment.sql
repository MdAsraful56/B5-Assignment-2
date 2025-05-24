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
('Alice Johnson', 'Sundarbans'),
('Bob Smith', 'Chittagong Hill Tracts'),
('Charlie Brown', 'Sylhet Forest'),
('Diana Prince', 'Barind Tract'),
('Ethan Ray', 'Haor Basin'),
('Farah Ahmed', 'Madhupur Jungle');


INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Asian Elephant', 'Elephas maximus', '1758-01-01', 'Endangered'),
('Hoolock Gibbon', 'Hoolock hoolock', '1771-01-01', 'Endangered'),
('Fishing Cat', 'Prionailurus viverrinus', '1833-01-01', 'Vulnerable'),
('Indian Pangolin', 'Manis crassicaudata', '1825-01-01', 'Endangered'),
('Oriental Pied Hornbill', 'Anthracoceros albirostris', '1786-01-01', 'Least Concern');


INSERT INTO sightings (species_id, ranger_id, sighting_time, location, notes) VALUES
(1, 1, '2024-04-15 06:45:00', 'Sundarbans Core Zone', 'Fresh paw prints and scratch marks found'),
(2, 5, '2024-04-18 17:30:00', 'Kaptai National Park', 'Elephant herd crossing a stream'),
(6, 3, '2024-04-20 08:10:00', 'Lawachara Rainforest', 'Gibbon calls recorded at dawn'),
(4, 6, '2024-04-22 19:00:00', 'Hail Haor Wetlands', 'Fishing cat spotted near water edge'),
(3, 5, '2024-04-25 05:55:00', 'Madhupur Forest', 'Burrow found, likely pangolin habitat'),
(6, 4, '2024-04-28 07:25:00', 'Rema-Kalenga Reserve', 'Hornbill pair nesting in tall tree');



