/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (8, 'Agumon', '2020-02-03', 0, true, 10.23),
       (9, 'Gabumon', '2018-11-15', 2, true, 8),
       (10, 'Pikachu', '2021-01-07', 1, false, 15.04),
       (11, 'Devimon', '2017-05-12', 5, true, 11);

--  FOR 2nd Part

INSERT INTO animals VALUES (1,' Charmander', '2020-02-08', 0, false, -11);
INSERT INTO animals VALUES (2,' Plantmon', '2021-11-15', 2, true, -5.7);
INSERT INTO animals VALUES (3,' Squirtle', '1993-04-02', 3, false, -12.13);
INSERT INTO animals VALUES (4,' Angemon', '2005-06-12', 1, true, -45);
INSERT INTO animals VALUES (5,' Boarmon', '2005-06-07', 7, true, 20.4);
INSERT INTO animals VALUES (6,' Blossom', '1998-10-13', 4, true, 17);
INSERT INTO animals VALUES (7,' Ditto', '2022-05-14', 4, true, 22);



-- FOR 3 Part 

-- FOR owner Table
INSERT INTO owners (full_name,age)
VALUES ('Sam Smith', 34), ('Jennifer Orwell', 19),('Bob', 45),('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);

-- FOR species Table 

INSERT INTO species (name) VALUES('Pokemon'), ('Digimon');

UPDATE animals SET species_id =1 WHERE name LIKE '%mon';
UPDATE animals SET species_id =2 WHERE species_id IS NULL;


-- UPDATE OF animal table Owner_id

UPDATE animals SET owner_id =1 WHERE name='Augumon';
UPDATE animals SET owner_id =2 WHERE name='Gabumon' OR name='Pikachu';
UPDATE animals SET owner_id =3 WHERE name='Devimon' OR name='Plantmon';
UPDATE animals SET owner_id = 4 WHERE name='Charmander' OR name='Blossom'OR name='Squirtle';
UPDATE animals SET owner_id =5 WHERE name='Angemon' OR  name='Boarmon';


-- FOR Part 4 

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


INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT a.id, v.id, '2020-10-03'
FROM animals a, vets v
WHERE a.name = 'Angemon' AND v.name = 'Jack Harkness';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT a.id, v.id, '2020-11-04'
FROM animals a, vets v
WHERE a.name = 'Angemon' AND v.name = 'Jack Harkness';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT a.id, v.id, '2019-01-24'
FROM animals a, vets v
WHERE a.name = 'Boarmon' AND v.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT a.id, v.id, '2019-05-15'
FROM animals a, vets v
WHERE a.name = 'Boarmon' AND v.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT a.id, v.id, '2020-02-27'
FROM animals a, vets v
WHERE a.name = 'Boarmon' AND v.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT a.id, v.id, '2020-08-03'
FROM animals a, vets v
WHERE a.name = 'Boarmon' AND v.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT a.id, v.id, '2020-05-24'
FROM animals a, vets v
WHERE a.name = 'Blossom' AND v.name = 'Stephanie Mendez';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT a.id, v.id, '2021-01-11'
FROM animals a, vets v
WHERE a.name = 'Blossom' AND v.name = 'William Tatcher';
