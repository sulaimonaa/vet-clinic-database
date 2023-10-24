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

ALTER TABLE animals ADD species CHAR(50);
