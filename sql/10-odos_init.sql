DROP DATABASE IF EXISTS odos_starter;

CREATE DATABASE odos_starter;

\c odos_starter;

CREATE TABLE Person(
id SERIAL PRIMARY KEY,
first_name varchar(50),
last_name varchar(50)
);

CREATE TABLE Registrant(
id SERIAL PRIMARY KEY,
first_name varchar(50),
last_name varchar(50)
);