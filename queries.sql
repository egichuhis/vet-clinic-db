/*Queries that provide answers to the questions from all projects.*/

SELECT *
FROM animals
WHERE name LIKE '%mon';

SELECT name
FROM animals
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name
FROM animals
WHERE neutered = true AND escape_attempts < 3;

SELECT date_of_birth
FROM animals
WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts
FROM animals
WHERE weight_kg > 10.5;

SELECT *
FROM animals
WHERE neutered = true;

SELECT *
FROM animals
WHERE name != 'Gabumon';

SELECT *
FROM animals
WHERE weight_kg BETWEEN 10.4 AND 17.3;


-- Begin the transaction
BEGIN;
UPDATE animals
SET species = 'unspecified';

-- Verify the change
SELECT *
FROM animals;

-- Roll back the transaction
ROLLBACK;

-- Verify that the species column reverted to its previous state
SELECT *
FROM animals;

-- Begin the transaction
BEGIN;
-- Update the species column to 'digimon' for animals with names ending in 'mon'
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

-- Update the species column to 'pokemon' for animals without a species
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

-- Verify the changes
SELECT *
FROM animals;

-- Commit the transaction
COMMIT;

-- Verify that changes persist after the commit
SELECT *
FROM animals;

-- Begin the transaction
BEGIN;

-- Delete all records from the animals table
DELETE FROM animals;

-- Verify that the records are deleted
SELECT *
FROM animals;

-- Roll back the transaction
ROLLBACK;

-- Verify if all records in the animals table still exist after the rollback
SELECT *
FROM animals;

-- Begin the transaction
BEGIN;

-- Delete all animals born after Jan 1st, 2022
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';

-- Create a savepoint for the transaction
SAVEPOINT my_savepoint;

-- Update all animals' weight to be their weight multiplied by -1
UPDATE animals
SET weight_kg = -1 * weight_kg;

-- Rollback to the savepoint
ROLLBACK
TO SAVEPOINT my_savepoint;

-- Update all animals' weights that are negative to be their weight multiplied by -1
UPDATE animals
SET weight_kg = -1 * weight_kg
WHERE weight_kg < 0;

-- Commit the transaction
COMMIT;


SELECT COUNT(*) AS total_animals
FROM animals;

SELECT COUNT(*) AS never_escaped_animals
FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg) AS average_weight
FROM animals;

SELECT neutered, SUM(escape_attempts) AS total_escape_attempts
FROM animals
GROUP BY neutered
ORDER BY total_escape_attempts DESC
LIMIT 1;

SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts) AS avg_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

SELECT a.name
FROM animals a
  JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Melody Pond';

SELECT a.name
FROM animals a
  JOIN species s ON a.species_id = s.id
WHERE s.name = 'Pokemon';

SELECT o.full_name, COALESCE(array_agg(a.name), '{No animals}') AS animals_owned
FROM owners o
  LEFT JOIN animals a ON o.id = a.owner_id
GROUP BY o.full_name;

SELECT s.name AS species, COUNT(*) AS total_animals
FROM animals a
  JOIN species s ON a.species_id = s.id
GROUP BY s.name;

SELECT a.name
FROM animals a
  JOIN owners o ON a.owner_id = o.id
  JOIN species s ON a.species_id = s.id
WHERE o.full_name = 'Jennifer Orwell' AND s.name = 'Digimon';

SELECT a.name
FROM animals a
  JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;

SELECT o.full_name, COUNT(*) AS total_animals_owned
FROM owners o
  JOIN animals a ON o.id = a.owner_id
GROUP BY o.full_name
ORDER BY total_animals_owned DESC
LIMIT 1;
