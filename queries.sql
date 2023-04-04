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




-- Who was the last animal seen by William Tatcher?
SELECT V.name as vet_name, A.name as animal_name, date_of_visit
FROM vets V INNER JOIN visits D ON D.vet_id = V.id INNER JOIN
animals A ON A.id = D.vet_id WHERE V.name = 'William Tatcher' ORDER BY D.date_of_visit DESC LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT V.name as vet_name, COUNT ( DISTINCT A.id) FROM vets V INNER JOIN visits D ON D.vet_id = V.id 
INNER JOIN animals A ON A.id = D.animal_id WHERE V.name = 'Stephanie Mendez' GROUP BY V.name;

-- List all vets and their specialties, including vets with no specialties.
SELECT V.name as vet_name, S.name as specialization FROM vets V LEFT JOIN specializations L ON L.vet_id = V.id 
LEFT JOIN species S ON S.id = L.species_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT V.name as vet_name,  A.name as animal_name, D.date_of_visit FROM vets V  JOIN visits D ON D.vet_id = V.id 
 JOIN animals A ON A.id = D.animal_id WHERE V.name = 'Stephanie Mendez' AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';


-- What animal has the most visits to vets?

SELECT  A.name as animal_name,COUNT (V.animal_id) as number_of_visit
FROM visits V JOIN animals A ON V.animal_id = A.id GROUP BY A.name  ORDER BY number_of_visit DESC LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT V.name as vet_name, A.name as animal_name, date_of_visit
FROM vets V  JOIN visits D ON D.vet_id = V.id  JOIN
animals A ON A.id = D.animal_id WHERE V.name = 'Maisy Smith' ORDER BY D.date_of_visit ASC LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT * FROM animals A JOIN visits D ON D.animal_id = A.id  JOIN
vets V ON V.id = D.vet_id ORDER BY D.date_of_visit DESC LIMIT 1;
-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) FROM visits JOIN vets ON visits.vet_id = vets.id
JOIN specializations ON vets.id = specializations.vet_id
JOIN species ON specializations.species_id = species.id
JOIN animals ON visits.animal_id = animals.id
WHERE species.id != animals.species_id;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name, COUNT(*) FROM animals JOIN species ON animals.species_id = species.id
WHERE owner_id = 4 GROUP BY species.name ORDER BY COUNT(*) DESC LIMIT 1;

SELECT COUNT(*) FROM visits where animal_id = 4;
SELECT * FROM visits where vet_id = 2;
SELECT * FROM owners where email = 'owner_18327@mail.com';
