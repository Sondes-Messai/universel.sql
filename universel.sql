-- create the universe database
CREATE DATABASE universe;

-- connect to the universe database
\c universe

-- create the galaxy table
CREATE TABLE galaxy (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  type TEXT
);

-- create the star table
CREATE TABLE star (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  age INTEGER,
  mass FLOAT,
  galaxy_id INTEGER REFERENCES galaxy(id)
);

-- create the planet table
CREATE TABLE planet (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  type TEXT,
  mass FLOAT,
  star_id INTEGER REFERENCES star(id)
);

-- create the moon table
CREATE TABLE moon (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  type TEXT,
  mass FLOAT,
  planet_id INTEGER REFERENCES planet(id)
);
CREATE DATABASE universe;
\c universe;

CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  age INT,
  distance_from_earth NUMERIC(10,2),
  has_life BOOLEAN NOT NULL,
  galaxy_type VARCHAR(255),
  UNIQUE (name)
);

CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  age INT,
  distance_from_earth NUMERIC(10,2),
  has_life BOOLEAN NOT NULL,
  spectral_type VARCHAR(255),
  galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
  UNIQUE (name)
);

CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  age INT,
distance_from_earth NUMERIC(10,2),
  has_life BOOLEAN NOT NULL,
  planet_type VARCHAR(255),
  star_id INT NOT NULL REFERENCES star(star_id),
  UNIQUE (name)
);

CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  age INT,
  distance_from_earth NUMERIC(10,2),
  has_life BOOLEAN NOT NULL,
  moon_type VARCHAR(255),
  planet_id INT NOT NULL REFERENCES planet(planet_id),
  UNIQUE (name)
);

CREATE TABLE galaxy_type (
  galaxy_type_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO galaxy_type (name) VALUES ('Spiral'), ('Elliptical'), ('Irregular'), ('Lenticular');

CREATE TABLE planet_type (
  planet_type_id SERIAL PRIMARY KEY,
name VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO planet_type (name) VALUES ('Terrestrial'), ('Gas Giant'), ('Ice Giant'), ('Dwarf Planet'), ('Exoplanet');

CREATE TABLE moon_type (
  moon_type_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO moon_type (name) VALUES ('Regular'), ('Irregular'), ('Tidal Locked'), ('Trans-Neptunian Object');

ALTER TABLE galaxy ADD COLUMN galaxy_type_id INT REFERENCES galaxy_type(galaxy_type_id);
