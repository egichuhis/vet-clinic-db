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

INSERT INTO vets
  (name, age, date_of_graduation)
VALUES
  ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets
  (name, age, date_of_graduation)
VALUES
  ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets
  (name, age, date_of_graduation)
VALUES
  ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets
  (name, age, date_of_graduation)
VALUES
  ('Jack Harkness', 38, '2008-06-08');

-- Assuming the IDs for the vets and species are known
INSERT INTO specializations
  (vet_id, species_id)
VALUES
  (1, 1);
-- William Tatcher is specialized in Pokemon
INSERT INTO specializations
  (vet_id, species_id)
VALUES
  (3, 1);
-- Stephanie Mendez is specialized in Pokemon
INSERT INTO specializations
  (vet_id, species_id)
VALUES
  (3, 2);
-- Stephanie Mendez is specialized in Digimon
INSERT INTO specializations (4, 2)
; -- Jack Harkness is specialized in Digimon

-- For vets table
SELECT id
FROM vets
WHERE name = 'William Tatcher';
SELECT id
FROM vets
WHERE name = 'Stephanie Mendez';
SELECT id
FROM vets
WHERE name = 'Jack Harkness';

-- For species table
SELECT id
FROM species
WHERE name = 'Pokemon';
SELECT id
FROM species
WHERE name = 'Digimon';


INSERT INTO specializations
  (vet_id, species_id)
VALUES
  (1, 1);
-- William Tatcher is specialized in Pokemon
INSERT INTO specializations
  (vet_id, species_id)
VALUES
  (3, 1);
-- Stephanie Mendez is specialized in Pokemon
INSERT INTO specializations
  (vet_id, species_id)
VALUES
  (3, 2);
-- Stephanie Mendez is specialized in Digimon
INSERT INTO specializations
  (vet_id, species_id)
VALUES
  (4, 2); -- Jack Harkness is specialized in Digimon


  INSERT INTO visits
  (vet_id, animal_id, visit_date)
VALUES
  (1, 1, '2020-05-24'),
  (3, 1, '2020-07-22'),
  (4, 2, '2021-02-02'),
  (2, 3, '2020-01-05'),
  (2, 3, '2020-03-08'),
  (2, 3, '2020-05-14'),
  (3, 4, '2021-05-04'),
  (4, 5, '2021-02-24'),
  (2, 6, '2019-12-21'),
  (1, 6, '2020-08-10'),
  (2, 6, '2021-04-07'),
  (3, 7, '2019-09-29'),
  (4, 8, '2020-10-03'),
  (4, 8, '2020-11-04'),
  (2, 9, '2019-01-24'),
  (2, 9, '2019-05-15'),
  (2, 9, '2020-02-27'),
  (2, 9, '2020-08-03'),
  (3, 10, '2020-05-24'),
  (1, 10, '2021-01-11');
