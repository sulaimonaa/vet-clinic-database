/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    PRIMARY KEY (id)
);
ALTER TABLE animals
ADD species CHAR(50);
CREATE TABLE owners (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    age INT
);
CREATE TABLE species (id INT AUTO_INCREMENT PRIMARY KEY, name CHAR(50));
ALTER TABLE animals
MODIFY COLUMN id INT AUTO_INCREMENT;

    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    age INT
);
CREATE TABLE species (id SERIAL PRIMARY KEY, name CHAR(50));
ALTER TABLE animals DROP COLUMN id;
ALTER TABLE animals
ADD COLUMN id SERIAL PRIMARY KEY;

ALTER TABLE animals DROP species;
ALTER TABLE animals
ADD COLUMN species_id INT;
ALTER TABLE animals
ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id);
ALTER TABLE animals
ADD COLUMN owners_id INT;
ALTER TABLE animals

ADD CONSTRAINT fk_owners FOREIGN KEY (owners_id) REFERENCES owners(id);
-- Create the vets table
CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    age INT,
    date_of_graduation DATE
);
-- Create the specializations table
CREATE TABLE specializations (
    vet_id INT,
    species_id INT,
    FOREIGN KEY (vet_id) REFERENCES vets(id)
);
-- Create the visits table
CREATE TABLE visits (
    animal_id INT,
    vet_id INT,
    visit_date DATE,
    FOREIGN KEY (animal_id) REFERENCES animals(id),
    FOREIGN KEY (vet_id) REFERENCES vets(id)
);
ALTER TABLE visits
ADD animal VARCHAR(100);

ADD CONSTRAINT fk_owners FOREIGN KEY (owners_id) REFERENCES owners(id);

