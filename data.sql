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
