/*Queries that provide answers to the questions from all projects.*/
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN TRANSACTION;
UPDATE animals SET species = 'unspecified';
ROLLBACK TRANSACTION;


BEGIN TRANSACTION;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species != 'digimon' OR species IS NULL;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
DELETE FROM animals;
ROLLBACK TRANSACTION;

BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth  > '2022-01-01';
SAVEPOINT del2022;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO del2022;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE  weight_kg < 0;
COMMIT TRANSACTION;

SELECT COUNT (*) FROM animals;
SELECT COUNT (*) FROM animals WHERE escape_attempts != 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered as neutered_animals , COUNT(*) as number_of_escape FROM animals WHERE escape_attempts > 0 GROUP BY neutered;
SELECT species, MIN(weight_kg) as minimum_weight , MAX(weight_kg) as maximum_weight FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) as avg_number_of_escape FROM animals WHERE date_of_birth BETWEEN '990-01-01' AND '2000-12-31' GROUP BY species;

SELECT name as animal_name, full_name FROM animals A JOIN owners O ON A.owner_id = O.id WHERE full_name = 'Melody Pond'; 
SELECT A.name as animal_name, S.name as specie_type FROM animals A JOIN species S ON A.species_id = S.id WHERE S.name = 'Pokemon'; 
SELECT full_name, name as animal_name FROM animals A RIGHT JOIN owners O ON A.owner_id = O.id ; 
SELECT species.name, COUNT(*) FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;
SELECT full_name, A.name FROM animals A JOIN owners O ON A.owner_id = O.id WHERE full_name = 'Jennifer Orwell';
SELECT full_name, A.name FROM animals A JOIN owners O ON A.owner_id = O.id WHERE full_name = 'Dean Winchester' AND escape_attempts < 1;
SELECT  full_name, COUNT (owner_id) AS total FROM animals A JOIN owners O ON A.owner_id = O.id GROUP BY O.full_name ORDER BY total DESC LIMIT 1; 