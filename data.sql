/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (1, 'Agumon', '2020-02-03', 0, true, 10.23),
       (2, 'Gabumon', '2018-11-15', 2, true, 8),
       (3, 'Pikachu', '2021-01-07', 1, false, 15.04),
       (4, 'Devimon', '2017-05-12', 5, true, 11);

--  FOR 2nd Part

INSERT INTO animals VALUES (1,' Charmander', '2020-02-08', 0, false, 11);
INSERT INTO animals VALUES (2,' Plantmon', '2021-11-15', 2, true, 5.7);
INSERT INTO animals VALUES (3,' Squirtle', '1993-04-02', 3, false, 12.13);
INSERT INTO animals VALUES (4,' Angemon', '2005-06-12', 1, true, 45);
INSERT INTO animals VALUES (5,' Boarmon', '2005-06-07', 7, true, 20.4);
INSERT INTO animals VALUES (6,' Blossom', '1998-10-13', 4, true, 17);
INSERT INTO animals VALUES (7,' Ditto', '2022-05-14', 4, true, 22);