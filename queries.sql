/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals
WHERE name LIKE '%mon';

SELECT name FROM animals
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name FROM animals
WHERE neutered = true AND escape_attempts < 3;
 
SELECT date_of_birth FROM animals
WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts FROM animals
WHERE weight_kg_kg > 10.5;

SELECT * FROM animals
WHERE neutered = true;

SELECT * FROM animals
WHERE name != 'Gabumon';

SELECT * FROM animals
WHERE weight_kg BETWEEN 10.4 AND 17.3;


--  FOR PART 2 

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species = 'unspecified';

COMMIT;

SELECT * FROM animals;


BEGIN TRANSACTION;

UPDATE animals SET weight = -1 * weight_kg;

SAVEPOINT weight_update;

ROLLBACK TO weight_update;

UPDATE animals SET weight_kg = -1 * weight_kg WHERE weight_kg < 0;

COMMIT;

--  QUESTION PART 

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, SUM(escape_attempts) AS total_escape_attempts FROM animals GROUP BY neutered;

SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species ;

SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species ;

--  PART 3 

-- SELECT animals owned by Melody Pond 

SELECT id, name, full_name FROM animals INNER JOIN owners ON animals.owner_id = owners.owner_id WHERE full_name='Melody Pond';

-- Show animals that are pokemon 

SELECT id, name, species_name FROM animals INNER JOIN species ON animals.species_id = species.species_id WHERE species_name='Pokemon';

-- Show people with animal they own or dont.

SELECT owners.owner_id, full_name, name FROM animals RIGHT JOIN owners ON animals.owner_id = owners.owner_id;

-- Animals per species 

SELECT species.species_id, species.species_name, count(animals.id) myCounts from species LEFT JOIN animals ON species.species_id=animals.species_id GROUP BY species.specieS_id, species.species_name;

-- animals OWNED BY Jennifer that are digimon

SELECT id, name, owner_id, species_name FROM animals INNER JOIN species ON animals.species_id = species.species_id WHERE species.species_name='Digimon' AND owner_id=2;

-- List all animals owned by Dean Winchester that haven't tried to escape.

SELECT id, name,full_name, escape_attempts FROM animals INNER JOIN owners ON animals.owner_id = owners.owner_id WHERE full_name='Dean Winchester' AND animals.escape_attempts=0;

SELECT owners.full_name, COUNT(animals.id) AS num_animals FROM owners INNER JOIN animals ON owners.owner_id = animals.owner_id GROUP BY owners.full_name ORDER BY num_animals DESC LIMIT 1;
