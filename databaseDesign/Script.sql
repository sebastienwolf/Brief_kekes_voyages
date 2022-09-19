CREATE TABLE Company(
  id_company COUNTER,
  iata_code VARCHAR(10),
  name VARCHAR(50),
  PRIMARY KEY(id_company)
);

CREATE TABLE Country(
  id_country COUNTER,
  name VARCHAR(50),
  PRIMARY KEY(id_country)
);

CREATE TABLE City(
  id_city COUNTER,
  name TEXT,
  id_country INT NOT NULL,
  PRIMARY KEY(id_city),
  FOREIGN KEY(id_country) REFERENCES Country(id_country)
);

CREATE TABLE airport(
  id_airport COUNTER,
  name VARCHAR(50),
  iata_code VARCHAR(10),
  id_city INT NOT NULL,
  PRIMARY KEY(id_airport),
  FOREIGN KEY(id_city) REFERENCES City(id_city)
);

CREATE TABLE Flight(
  id_flight COUNTER,
  date_departure DATETIME,
  date_arrival DATETIME,
  number_of_flight VARCHAR(10),
  state INT,
  id_airport_arrive INT NOT NULL,
  id_airport_depart INT NOT NULL,
  PRIMARY KEY(id_flight),
  FOREIGN KEY(id_airport_arrive) REFERENCES airport(id_airport),
  FOREIGN KEY(id_airport_depart) REFERENCES airport(id_airport)
);

CREATE TABLE Booking(
  id_booking COUNTER,
  number_booking VARCHAR(20),
  passport VARCHAR(9),
  last_name VARCHAR(50),
  first_name VARCHAR(50),
  date_of_birth DATE,
  email VARCHAR(100),
  phone_number VARCHAR(50),
  price DECIMAL(15,2),
  state INT,
  date_booking VARCHAR(50),
  id_flight INT NOT NULL,
  PRIMARY KEY(id_booking),
  FOREIGN KEY(id_flight) REFERENCES Flight(id_flight)
);

CREATE TABLE engage(
  id_flight INT,
  id_company INT,
  PRIMARY KEY(id_flight, id_company),
  FOREIGN KEY(id_flight) REFERENCES Flight(id_flight),
  FOREIGN KEY(id_company) REFERENCES Company(id_company)
);

CREATE TABLE stopover(
  id_flight INT,
  id_airport INT,
  date_departure DATETIME,
  date_arrival DATETIME,
  PRIMARY KEY(id_flight, id_airport),
  FOREIGN KEY(id_flight) REFERENCES Flight(id_flight),
  FOREIGN KEY(id_airport) REFERENCES airport(id_airport)
);