/* Populate database with sample data. */
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
-- Insert data for vets
INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');
-- Insert data for specializations
INSERT INTO specializations (vet_id, species_id)
VALUES (1, 1),
(3, 2),
(3, 1),
(4, 2);
-- Insert data for visits
INSERT INTO visits (animal, vet_id, visit_date)
VALUES ('Agumon', 1, TO_DATE('2020-05-24', 'YYYY-MM-DD')),
('Agumon', 3, TO_DATE('2020-07-22', 'YYYY-MM-DD')),
(
        'Gabumon',
        4,
        TO_DATE('2021-02-02', 'YYYY-MM-DD')
    ),
(
        'Pikachu',
        2,
        TO_DATE('2020-01-05', 'YYYY-MM-DD')
    ),
(
        'Pikachu',
        2,
        TO_DATE('2020-03-08', 'YYYY-MM-DD')
    ),
(
        'Pikachu',
        2,
        TO_DATE('2020-05-14', 'YYYY-MM-DD')
    ),
(
        'Devimon',
        3,
        TO_DATE('2021-05-04', 'YYYY-MM-DD')
    ),
(
        'Charmander',
        4,
        TO_DATE('2021-02-24', 'YYYY-MM-DD')
    ),
(
        'Plantmon',
        2,
        TO_DATE('2019-12-21', 'YYYY-MM-DD')
    ),
(
        'Plantmon',
        1,
        TO_DATE('2020-08-10', 'YYYY-MM-DD')
    ),
(
        'Plantmon',
        2,
        TO_DATE('2021-04-07', 'YYYY-MM-DD')
    ),
(
        'Squirtle',
        3,
        TO_DATE('2019-09-29', 'YYYY-MM-DD')
    ),
(
        'Angemon',
        4,
        TO_DATE('2020-10-03', 'YYYY-MM-DD')
    ),
(
        'Angemon',
        4,
        TO_DATE('2020-11-04', 'YYYY-MM-DD')
    ),
(
        'Boarmon',
        2,
        TO_DATE('2019-01-24', 'YYYY-MM-DD')
    ),
(
        'Boarmon',
        2,
        TO_DATE('2019-05-15', 'YYYY-MM-DD')
    ),
(
        'Boarmon',
        2,
        TO_DATE('2020-02-27', 'YYYY-MM-DD')
    ),
(
        'Boarmon',
        2,
        TO_DATE('2020-08-03', 'YYYY-MM-DD')
    ),
(
        'Blossom',
        3,
        TO_DATE('2020-05-24', 'YYYY-MM-DD')
    ),
(
        'Blossom',
        1,
        TO_DATE('2021-01-11', 'YYYY-MM-DD')
    );