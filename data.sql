/* Populate database with sample data. */
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-15', 5, true, 11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '2020-02-08', 0 , false, -11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '2021-11-15', 2 , true, -5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '1993-04-02', 3 , false, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '2005-06-12', 1 , true, -45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '2005-06-07', 7 , true, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '1998-10-13', 3 , true, 17);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', '2002-04-14', 4 , true, 22);

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon')
INSERT INTO species (name) VALUES ('Digimon')

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = 3 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id = 3 WHERE name = 'Angemon' OR name = 'Boarmon';

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations ( vet_id, species_id) VALUES (1, 1);
INSERT INTO specializations ( vet_id, species_id) VALUES (3, 2);
INSERT INTO specializations ( vet_id, species_id) VALUES (3, 1);
INSERT INTO specializations ( vet_id, species_id) VALUES (4, 2);
Devimon visited Stephanie Mendez on May 4th, 2021.
                                                                                      visited Jack Harkness on Feb 24th, 2021.
                                                                                     Plantmon visited Maisy Smith on Dec 21st, 2019.
                                                                                     Plantmon visited William Tatcher on Aug 10th, 2020.
                                                                                     Plantmon visited Maisy Smith on Apr 7th, 2021.
                                                                                     Squirtle visited Stephanie Mendez on Sep 29th, 2019.
                                                                                     Angemon visited Jack Harkness on Oct 3rd, 2020.
                                                                                     Angemon visited Jack Harkness on Nov 4th, 2020.
                                                                                     Boarmon visited Maisy Smith on Jan 24th, 2019.
                                                                                     Boarmon visited Maisy Smith on May 15th, 2019.
                                                                                     Boarmon visited Maisy Smith on Feb 27th, 2020.
                                                                                     Boarmon visited Maisy Smith on Aug 3rd, 2020.
                                                                                     Blossom visited Stephanie Mendez on May 24th, 2020.
                                                                                     Blossom visited William Tatcher on Jan 11th, 2021.

INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES ( (SELECT id from animals WHERE name = 'Agumon'), (SELECT id from vets WHERE name = 'William Tatcher'),'2020-05-24');
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES ((SELECT id from animals WHERE name = 'Agumon'), (SELECT id from vets WHERE name = 'Stephanie Mendez'),'2020-07-22');
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES ((SELECT id from animals WHERE name = 'Gabumon'), (SELECT id from vets WHERE name = 'Jack Harkness'),	'2021-02-02');
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES ((SELECT id from animals WHERE name = 'Pikachu'), (SELECT id from vets WHERE name = 'Maisy Smith'),	'2020-01-05');
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES ((SELECT id from animals WHERE name = 'Pikachu'), (SELECT id from vets WHERE name = 'Maisy Smith'),	'2020-03-08');
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES ((SELECT id from animals WHERE name = 'Pikachu'), (SELECT id from vets WHERE name = 'Maisy Smith'),	'2020-05-14');
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES ( (SELECT id from animals WHERE name = 'Charmander'), (SELECT id from vets WHERE name = 'Jack Harkness'),'2021-02-24');
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES ((SELECT id from animals WHERE name = 'Plantmon'), (SELECT id from vets WHERE name = 'Maisy Smith'),'2019-12-21');
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES ((SELECT id from animals WHERE name = 'Plantmon'), (SELECT id from vets WHERE name = 'William Tatcher'),	'2020-08-10');
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES ((SELECT id from animals WHERE name = 'Plantmon'), (SELECT id from vets WHERE name = 'Maisy Smith'),	'2021-04-07');
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES ((SELECT id from animals WHERE name = 'Pikachu'), (SELECT id from vets WHERE name = 'Maisy Smith'),	'2020-03-08');
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES ((SELECT id from animals WHERE name = 'Pikachu'), (SELECT id from vets WHERE name = 'Maisy Smith'),	'2020-05-14');


