/*Queries that provide answers to the questions from all projects.*/

SELECT *
from animals
WHERE name LIKE '%mon';
SELECT name
FROM animals
WHERE YEAR(date_of_birth) BETWEEN 2016 AND 2019;
SELECT name
FROM animals
WHERE neutered = 1
    AND escape_attempts < 3;
SELECT date_of_birth
FROM animals
WHERE name IN ('Argumon', 'Pikachu');
SELECT name,
    escape_attempts
FROM animals
WHERE weight_kg > 10.5;
SELECT *
FROM animals
WHERE neutered = 1;
SELECT *
FROM animals
WHERE name <> 'Gabumon';
SELECT *
FROM animals
WHERE weight_kg BETWEEN 10.4 AND 17.3;

SELECT * from animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 2016 AND 2019;

SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name IN ('Argumon', 'Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = true;

SELECT * FROM animals WHERE name <> 'Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


-- Start a transaction
START TRANSACTION;
-- Update the species column to "unspecified" for all animals
UPDATE animals SET species = 'unspecified';

SELECT *
FROM animals;
-- Roll back the transaction
ROLLBACK;
-- Verify that the species column went back to the state before the transaction
SELECT *
FROM animals;
-- Start a transaction for updating
START TRANSACTION;
-- Update the species column to "digimon" for animals with names ending in "mon"

UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
-- Update the species column to "pokemon" for animals without a species set
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL
    OR species = '';

SELECT *
FROM animals;
-- Commit the transaction
COMMIT;
-- Verify that the changes persist after the commit
SELECT *
FROM animals;
-- Start a transaction for deleting records
START TRANSACTION;
-- Delete all records in the animals table
DELETE FROM animals;
-- Roll back the transaction
ROLLBACK;
-- Verify if all records in the animals table still exist
SELECT *
FROM animals;
-- Start a transaction
START TRANSACTION;
-- Delete all animals born after Jan 1st, 2022

DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
-- Set a savepoint
SAVEPOINT my_savepoint;
-- Update all animals' weight to be their weight multiplied by -1

UPDATE animals
SET weight_kg = weight_kg * -1;
-- Rollback to the savepoint
ROLLBACK TO my_savepoint;
-- Update all animals' weights that are negative to be their weight multiplied by -1

UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
-- Commit the transaction
COMMIT;
--How many animals are there?
SELECT COUNT(*) AS total_animals
FROM animals;
--How many animals have never tried to escape?

SELECT COUNT(*) AS never_escaped
FROM animals
WHERE escape_attempts = 0;
--What is the average weight of animals?
SELECT AVG(weight_kg) AS average_weight
FROM animals;
--Who escapes the most, neutered or not neutered animals?

SELECT neutered,
    SUM(escape_attempts) AS total_escape_attempts
FROM animals
GROUP BY neutered
ORDER BY total_escape_attempts DESC
LIMIT 1;
--What is the minimum and maximum weight of each type of animal?
SELECT species,
    MIN(weight_kg) AS min_weight,
    MAX(weight_kg) AS max_weight
FROM animals
GROUP BY species;
--What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species,
    AVG(escape_attempts) AS average_escape_attempts
FROM animals
WHERE Year(date_of_birth) BETWEEN 1990 AND 2000
GROUP BY species;
SELECT a.name
FROM animals a
    JOIN owners o ON a.owners_id = o.id
WHERE o.full_name = 'Melody Pond';
SELECT a.name
FROM animals a
    JOIN species s ON a.species_id = s.id
WHERE s.name = 'Pokemon';
SELECT o.full_name,
    COALESCE(a.name, 'No animals') AS animal
FROM owners o
    LEFT JOIN animals a ON o.id = a.owners_id;
SELECT s.name AS species,
    COUNT(a.id) AS total_animals
FROM species s
    LEFT JOIN animals a ON s.id = a.species_id
GROUP BY s.name;
SELECT a.name
FROM animals a
    JOIN species s ON a.species_id = s.id
    JOIN owners o ON a.owners_id = o.id
WHERE s.name = 'Digimon'
    AND o.full_name = 'Jennifer Orwell';
SELECT a.name
FROM animals a
    JOIN owners o ON a.owners_id = o.id
    LEFT JOIN animals e ON a.id = e.owners_id
WHERE o.full_name = 'Dean Winchester'
    AND e.escape_attempts IS NULL;
SELECT o.full_name,
    COUNT(a.id) AS total_animals
FROM owners o
    LEFT JOIN animals a ON o.id = a.owners_id
GROUP BY o.id
ORDER BY total_animals DESC
LIMIT 1;
