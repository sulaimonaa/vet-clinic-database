/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

ALTER TABLE animals ADD species CHAR(50);

CREATE TABLE owners (id INT AUTO_INCREMENT PRIMARY KEY, full_name VARCHAR(100), age INT);

CREATE TABLE species (id INT AUTO_INCREMENT PRIMARY KEY, name CHAR(50));

ALTER TABLE animals MODIFY COLUMN id INT AUTO_INCREMENT;

ALTER TABLE animals DROP species;

ALTER TABLE animals ADD COLUMN species_id INT;

ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owners_id INT;

ALTER TABLE animals ADD CONSTRAINT fk_owners FOREIGN KEY (owners_id) REFERENCES owners(id);

