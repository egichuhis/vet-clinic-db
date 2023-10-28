/* Database schema to keep the structure of entire database. */

CREATE TABLE animals
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL(10, 2)
);

ALTER TABLE animals
ADD species VARCHAR(255);

CREATE TABLE owners
(
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255),
    age INTEGER
);

CREATE TABLE species
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

-- Drop the existing foreign key constraints if they exist
ALTER TABLE animals DROP CONSTRAINT IF EXISTS fk_species;
ALTER TABLE animals DROP CONSTRAINT IF EXISTS fk_owner;

-- Drop the existing column species
ALTER TABLE animals DROP COLUMN IF EXISTS species;

-- Add the column species_id as a foreign key referencing the species table
ALTER TABLE animals ADD COLUMN species_id INTEGER;
ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id);

-- Add the column owner_id as a foreign key referencing the owners table
ALTER TABLE animals ADD COLUMN owner_id INTEGER;
ALTER TABLE animals ADD CONSTRAINT fk_owner FOREIGN KEY (owner_id) REFERENCES owners(id);

ALTER TABLE animals 
ADD COLUMN species_id INTEGER;

ALTER TABLE animals 
ADD COLUMN owner_id INTEGER;

CREATE TABLE vets
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    age INTEGER,
    date_of_graduation DATE
);

CREATE TABLE specializations
(
    vet_id INTEGER,
    species_id INTEGER,
    PRIMARY KEY (vet_id, species_id),
    FOREIGN KEY (vet_id) REFERENCES vets(id),
    FOREIGN KEY (species_id) REFERENCES species(id)
);

CREATE TABLE visits
(
    vet_id INTEGER,
    animal_id INTEGER,
    visit_date DATE,
    PRIMARY KEY (vet_id, animal_id, visit_date),
    FOREIGN KEY (vet_id) REFERENCES vets(id),
    FOREIGN KEY (animal_id) REFERENCES animals(id)
);


