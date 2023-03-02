/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INTEGER PRIMARY KEY,
    name TEXT,
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

-- FOR PART 2

ALTER TABLE animals
ADD species varchar(255);

-- FOR PART 3

CREATE TABLE owners(
   id SERIAL PRIMARY KEY,
   full_name VARCHAR(50) NOT NULL, age INT NOT NULL
);

CREATE TABLE species (
  id SERIAL PRIMARY KEY, 
  name VARCHAR(50) NOT NULL
);

ALTER TABLE animals
DROP COLUMN species;


ALTER TABLE animals ADD species_id INT;

-- add owner id column
ALTER TABLE animals ADD owner_id INT;

-- make species_id foreign key with reference from species tbl
ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species(id);

-- make owners_id foreign key with refrence from owners tbl
ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owner(owner_id);

-- FOR PART 4

-- VETS Table Creation
CREATE TABLE vets (id SERIAL PRIMARY KEY,
name varchar,
age INT NOT NULL,
date_of_graduation date );

-- Specialization Table Creation
CREATE TABLE specializations (
species_id int,
vet_id int,
PRIMARY KEY (species_id, vet_id)
);

-- Visits Table Creation.

CREATE TABLE visits (
animal_id int,
vet_id int,
visit_date date,
PRIMARY KEY(animal_id, visit_date));
