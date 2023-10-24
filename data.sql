/* Populate database with sample data. */

INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) 
VALUES (1,'Argumon',TO_DATE('2020-02-03', 'YYYY-MM-DD'),0,true,10.23), (2,'Gabumon',TO_DATE('2018-11-15', 'YYYY-MM-DD'),2,true,8), (3,'Pikachu',TO_DATE('2021-01-07', 'YYYY-MM-DD'),1,false,15.04), (4,'Devimon',TO_DATE('2017-05-12', 'YYYY-MM-DD'),5,true,11);

INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (5,'Charmander',TO_DATE('2020-02-08', 'YYYY-MM-DD'),0,false,-11), (6,'Plantmon',TO_DATE('2021-11-15', 'YYYY-MM-DD'),2,true,-5.7), (7,'Squirtle',TO_DATE('1993-04-02', 'YYYY-MM-DD'),3,false,-12.13), (8,'Angemon',TO_DATE('2005-06-12', 'YYYY-MM-DD'),1,true,-45), (9,'Boarmon',TO_DATE('2005-06-07', 'YYYY-MM-DD'),7,true,20.4), (10,'Blossom',TO_DATE('1998-10-13', 'YYYY-MM-DD'),3,true,17), (11,'Ditto',TO_DATE('2022-05-14', 'YYYY-MM-DD'),4,true,22);
