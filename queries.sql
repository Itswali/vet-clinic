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

-- List owner who owns most animal
SELECT owners.full_name, COUNT(animals.id) AS num_animals FROM owners INNER JOIN animals ON owners.owner_id = animals.owner_id GROUP BY owners.full_name ORDER BY num_animals DESC LIMIT 1;

-- FOR PART 4

INSERT INTO vets (name, age, date_0f_graduation)
VALUES ('William Tatcher',45, '2000-04-23'),
		('Maisy Smith', 26, '2019-01-17'),
		('Stephanie Mendez', 64, '1981-05-04'),
		('Jack Harkness', 38, '2008-01-08') ;


INSERT INTO specialization (species_id, vet_id)
SELECT s.species_id, v.id
FROM species s, vets v
WHERE s.species_name = 'Pokemon' AND v.name = 'William Tatcher';

INSERT INTO specialization (species_id, vet_id)
SELECT s.species_id, v.id
FROM species s, vets v
WHERE (s.species_name = 'Digimon' OR s.species_name = 'Pokemon') AND v.name = 'Stephanie Mendez';
     
INSERT INTO specialization (species_id, vet_id)
SELECT s.species_id, v.id
FROM species s, vets v
WHERE s.species_name = 'Digimon' AND v.name = 'Jack Harkness';
     
INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT a.id, v.id, '2020-05-24'
FROM animals a, vets v
WHERE a.name = 'Agumon' AND v.name = 'William Tatcher';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT a.id, v.id, '2020-07-22'
FROM animals a, vets v
WHERE a.name = 'Agumon' AND v.name = 'Stephanie Mendez';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT a.id, v.id, '2021-02-02'
FROM animals a, vets v
WHERE a.name = 'Gabumon' AND v.name = 'Jack Harkness';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT a.id, v.id, '2020-01-05'
FROM animals a, vets v
WHERE a.name = 'Pikachu' AND v.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT a.id, v.id, '2020-03-08'
FROM animals a, vets v
WHERE a.name = 'Pikachu' AND v.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT a.id, v.id, '2020-05-14'
FROM animals a, vets v
WHERE a.name = 'Pikachu' AND v.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT a.id, v.id, '2021-05-04'
FROM animals a, vets v
WHERE a.name = 'Devimon' AND v.name = 'Stephanie Mendez';

		 
INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT a.id, v.id, '2021-12-21'
FROM animals a, vets v
WHERE a.name = 'Plantmon' AND v.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT a.id, v.id, '2021-02-24'
FROM animals a, vets v
WHERE a.name = 'Charmander' AND v.name = 'Jack Harkness';


INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT a.id, v.id, '2020-08-10'
FROM animals a, vets v
WHERE a.name = 'Plantmon' AND v.name = 'William Tatcher';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT a.id, v.id, '2021-04-07'
FROM animals a, vets v
WHERE a.name = 'Plantmon' AND v.name = 'William Tatcher';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT a.id, v.id, '2019-09-29'
FROM animals a, vets v
WHERE a.name = 'Squirtle' AND v.name = 'Stephanie Mendez';


INSERT INTO visits (animal_id, vet_id, visit_date) SELECT a.id, v.id, '2020-10-03'
FROM animals a, vets v WHERE a.name = 'Angemon' AND v.name = 'Jack Harkness';

INSERT INTO visits (animal_id, vet_id, visit_date) SELECT a.id, v.id, '2020-11-04'
FROM animals a, vets v WHERE a.name = 'Angemon' AND v.name = 'Jack Harkness';

INSERT INTO visits (animal_id, vet_id, visit_date) SELECT a.id, v.id, '2019-01-24'
FROM animals a, vets v WHERE a.name = 'Boarmon' AND v.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, visit_date) SELECT a.id, v.id, '2019-05-15'
FROM animals a, vets v WHERE a.name = 'Boarmon' AND v.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, visit_date) SELECT a.id, v.id, '2020-02-27'
FROM animals a, vets v WHERE a.name = 'Boarmon' AND v.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, visit_date) SELECT a.id, v.id, '2020-08-03'
FROM animals a, vets v WHERE a.name = 'Boarmon' AND v.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, visit_date) SELECT a.id, v.id, '2020-05-24'
FROM animals a, vets v WHERE a.name = 'Blossom' AND v.name = 'Stephanie Mendez';

INSERT INTO visits (animal_id, vet_id, visit_date) SELECT a.id, v.id, '2021-01-11' FROM animals a, vets v
WHERE a.name = 'Blossom' AND v.name = 'William Tatcher';


-- FOR PART 4.

SELECT a.name FROM animals a
JOIN visits v ON a.id = v.animal_id JOIN vets ve ON v.vet_id = ve.id
WHERE ve.name = 'William Tatcher' ORDER BY v.visit_date DESC LIMIT 1;


SELECT COUNT(DISTINCT a.id) FROM animals a
JOIN visits v ON a.id = v.animal_id JOIN vets ve ON v.vet_id = ve.id WHERE ve.name = 'Stephanie Mendez';


SELECT ve.name, s.species_name FROM vets ve LEFT JOIN specialization sp ON ve.id = sp.vet_id
LEFT JOIN species s ON sp.species_id = s.species_id;


SELECT a.name FROM animals a JOIN visits v ON a.id = v.animal_id JOIN vets ve ON v.vet_id = ve.id
WHERE ve.name = 'Stephanie Mendez' AND v.visit_date BETWEEN '2020-04-01' AND '2020-08-30';


SELECT a.name, COUNT(v.animal_id) AS visits FROM animals a JOIN visits v ON a.id = v.animal_id
GROUP BY a.name ORDER BY visits DESC LIMIT 1;


SELECT a.name, ve.name, v.visit_date FROM animals a JOIN visits v ON a.id = v.animal_id
JOIN vets ve ON v.vet_id = ve.id ORDER BY v.visit_date DESC LIMIT 1;


SELECT a.name, COUNT(v.animal_id) AS visits FROM animals a JOIN visits v ON a.id = v.animal_id
GROUP BY a.name ORDER BY visits DESC LIMIT 1;


SELECT a.name FROM animals a JOIN visits v ON a.id = v.animal_id JOIN vets ve ON v.vet_id = ve.id
WHERE ve.name = 'Maisy Smith' ORDER BY v.visit_date ASC LIMIT 1;
