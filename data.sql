
INSERT INTO animals (
        id,
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES (1, 'Argumon', 2020 -02 -03, 0, true, 10.23),
    (2, 'Gabumon', 2018 -11 -15, 2, true, 8),
    (3, 'Pikachu', 2021 -01 -07, 1, false, 15.04),
    (4, 'Devimon', 2017 -05 -12, 5, true, 11),
    (5, 'Charmander', 2020 -02 -08, 0, false, 11),
    (6, 'Plantmon', 2021 -11 -15, 2, true, -5.7),
    (7, 'Squirtle', 1993 -04 -02, 3, false, -12.13),
    (8, 'Angemon', 2005 -06 -12, 1, true, -45),
    (9, 'Boarmon', 2005 -06 -07, 7, true, 20.4),
    (10, 'Blossom', 1998 -10 -13, 3, true, 17),
    (11, 'Ditto', 2022 -05 -14, 4, true, 22);
INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);
INSERT INTO species (name)
VALUES ('Pokemon'),
    ('Digimon');
-- Update the species_id based on name
UPDATE animals
SET species_id = (
        CASE
            WHEN name LIKE '%mon' THEN 2
            ELSE 1
        END
    );
-- Update owner_id based on owner's first name and animal name
UPDATE animals
SET owners_id = (
        CASE
            WHEN name = 'Agumon' THEN (
                SELECT id
                FROM owners
                WHERE full_name = 'Sam Smith'
            )
            WHEN name IN ('Gabumon', 'Pikachu') THEN (
                SELECT id
                FROM owners
                WHERE full_name = 'Jennifer Orwell'
            )
            WHEN name IN ('Devimon', 'Plantmon') THEN (
                SELECT id
                FROM owners
                WHERE full_name = 'Bob'
            )
            WHEN name IN ('Charmander', 'Squirtle', 'Blossom') THEN (
                SELECT id
                FROM owners
                WHERE full_name = 'Melody Pond'
            )
            WHEN name IN ('Angemon', 'Boarmon') THEN (
                SELECT id
                FROM owners
                WHERE full_name = 'Dean Winchester'
            )
        END
    );


INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) 
VALUES (1,'Argumon',TO_DATE('2020-02-03', 'YYYY-MM-DD'),0,true,10.23), (2,'Gabumon',TO_DATE('2018-11-15', 'YYYY-MM-DD'),2,true,8), (3,'Pikachu',TO_DATE('2021-01-07', 'YYYY-MM-DD'),1,false,15.04), (4,'Devimon',TO_DATE('2017-05-12', 'YYYY-MM-DD'),5,true,11);

INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (5,'Charmander',TO_DATE('2020-02-08', 'YYYY-MM-DD'),0,false,-11), (6,'Plantmon',TO_DATE('2021-11-15', 'YYYY-MM-DD'),2,true,-5.7), (7,'Squirtle',TO_DATE('1993-04-02', 'YYYY-MM-DD'),3,false,-12.13), (8,'Angemon',TO_DATE('2005-06-12', 'YYYY-MM-DD'),1,true,-45), (9,'Boarmon',TO_DATE('2005-06-07', 'YYYY-MM-DD'),7,true,20.4), (10,'Blossom',TO_DATE('1998-10-13', 'YYYY-MM-DD'),3,true,17), (11,'Ditto',TO_DATE('2022-05-14', 'YYYY-MM-DD'),4,true,22);

