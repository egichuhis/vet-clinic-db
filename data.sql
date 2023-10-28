/* Populate database with sample data. */

INSERT INTO animals
VALUES
  (DEFAULT, 'Agumon', '2020-02-03', 0, true, 10.23),
  (DEFAULT, 'Gabumon', '2018-11-15', 2, true, 8),
  (DEFAULT, 'Pikachu', '2021-01-07', 1, false, 15.04),
  (DEFAULT, 'Devimon', '2017-05-12', 5, true, 11);

INSERT INTO animals
VALUES
  (DEFAULT, 'Charmander', '2020-02-08', 0, false, -11, NULL),
  (DEFAULT, 'Plantmon', '2021-11-15', 2, true, -5.7, NULL),
  (DEFAULT, 'Squirtle', '1993-04-02', 3, false, -12.13, NULL),
  (DEFAULT, 'Angemon', '2005-06-12', 1, true, -45, NULL),
  (DEFAULT, 'Boarmon', '2005-06-07', 7, true, 20.4, NULL),
  (DEFAULT, 'Blossom', '1998-10-13', 3, true, 17, NULL),
  (DEFAULT, 'Ditto', '2022-05-14', 4, true, 22, NULL);

INSERT INTO owners
  (full_name, age)
VALUES
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);

INSERT INTO species
  (name)
VALUES
  ('Pokemon');
INSERT INTO species
  (name)
VALUES
  ('Digimon');

UPDATE animals 
SET species_id = 
    CASE 
        WHEN name LIKE '%mon' THEN (SELECT id
FROM species
WHERE name = 'Digimon')
        ELSE (SELECT id
FROM species
WHERE name = 'Pokemon')
    END;

UPDATE animals 
SET species_id = 
    CASE 
        WHEN name LIKE '%mon' THEN (SELECT id
FROM species
WHERE name = 'Digimon')
        ELSE (SELECT id
FROM species
WHERE name = 'Pokemon')
    END;

UPDATE animals 
SET owner_id = (SELECT id
FROM owners
WHERE full_name = 'Sam Smith') 
WHERE name = 'Agumon';

UPDATE animals 
SET owner_id = (SELECT id
FROM owners
WHERE full_name = 'Jennifer Orwell') 
WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals 
SET owner_id = (SELECT id
FROM owners
WHERE full_name = 'Bob') 
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals 
SET owner_id = (SELECT id
FROM owners
WHERE full_name = 'Melody Pond') 
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals 
SET owner_id = (SELECT id
FROM owners
WHERE full_name = 'Dean Winchester') 
WHERE name IN ('Angemon', 'Boarmon');
