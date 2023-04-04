/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(30) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL,
);

ALTER TABLE animals ADD COLUMN species VARCHAR(50);

CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE species (
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
name VARCHAR(100) NOT NULL);


ALTER TABLE animals DROP COLUMN species
ALTER TABLE animals ADD COLUMN species_id INT, ADD CONSTRAINT fk_species_id FOREIGN KEY (species_id) REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owner_id INT, ADD CONSTRAINT fk_owner_id FOREIGN KEY (owner_id) REFERENCES owners(id);


CREATE TABLE vets (id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,	name varchar (100) NOT NULL,
	age INT NOT NULL, date_of_graduation DATE NOT NULL );

CREATE TABLE specializations (  vet_id INTEGER REFERENCES vets(id),  species_id INTEGER REFERENCES species(id),  PRIMARY KEY (vet_id, species_id) );
ALTER TABLE animals ADD CONSTRAINT animals_id_unique UNIQUE (id);

CREATE TABLE visits ( id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, animal_id INT REFERENCES animals(id),	vet_id INT REFERENCES vets(id),	date_of_graduation DATE );

ALTER TABLE visits RENAME COLUMN date_of_graduation TO date_of_visit;

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);
ALTER TABLE owners ALTER COLUMN age DROP NOT NULL;


CREATE INDEX animals_id_desc ON visits (animal_id ASC);
CREATE INDEX vet_id_desc ON visits (vet_id ASC);
CREATE INDEX email_desc ON owners (email ASC);
