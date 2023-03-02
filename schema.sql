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