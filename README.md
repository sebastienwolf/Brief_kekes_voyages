# Règles de gestion

## Client
- Peu reserver pour un ou plusieur passager


## Réservation
- Concerne qu'un seul vol et un seul passager
- peu être annuler par le client
- un numero de résevation
- téléphone
- nom
- prénom
- l'agence doit confirmer la réservation

## Vol
- Le vol contient un numéro de vol
- Contiens un aéroport de départ, une date et une heure
- Contiens un aéroport d'arrivée, une date et une heure
- Contiens un ou plusieurs passagers
- Peut-être réservé ou non
- Peut faire des escales dans un aéroport
- Est un trajet du point de départ au point final

## Aéroport
- Ce trouve dans une ville

## Escale
- Se fait a un aéroport
- Contiens une date et une heure d'arrivée
- Contiens une date et une heure de départ


# Dictionnaire

| Code mnémonique       | Désignation                                                                                              | Type | Taille | Remarque                   |
| ----------------------| -------------------------------------------------------------------------------------------------------- | ---- | ------ | -------------------------- |
| number_booking        | Numéro de réservation                                                                                    | AN   | 20     |                            |
| passeport_booking     | Code d'identification du passager                                                                        | AN   | 9      |                            |
| last_name_booking     | Nom du passager                                                                                          | A    | 50     |                            |
| first_name_booking    | Prénom du passager                                                                                       | A    | 50     |                            |
| date_of_birth_booking | Âge du passager                                                                                          | DATE |        | Au format AAAA-JJ-MM       |
| email_booking         | Mail du passager ou d'un contact pour envoyer des documents par exemple : envoyer le billet              | AN   | 100    |                            |
| phone_number_booking  | Téléphone du passager ou de contact                                                                      | AN   | 15     |                            |
| price_booking         | Prix du vol                                                                                              | N    | 15     |                            |
| state_booking         | Définit le statut de la réservation, en attente, confirmer par la compagnie, annuler par le passager     | AN   | 10     |                            |
| date_booking          | Date de la réservation                                                                                   | DATE |        | Au format AAAA-JJ-MM       |
| date_departure_flight | Date et l'heure du départ du vol                                                                         | DATE |        | Au format AAAA-JJ-MM h:m:s |
| date_arrival_flight   | Date et l'heure du arrivée du vol                                                                        | DATE |        | Au format AAAA-JJ-MM h:m:s |
| number_of_flight      | Numéro d'identification du vol                                                                           | AN   | 10     |                            |
| state_flight          | Définit le statut du vol, annuler, ouvert, fermer                                                        | AN   | 10     |                            |
| date_departure_stopover| Date et l'heure du départ de l'escale                                                                   | DATE |        | Au format AAAA-JJ-MM h:m:s |
| date_arrival_stopover | Date et l'heure du arrivée de l'escale                                                                   | DATE |        | Au format AAAA-JJ-MM h:m:s |
| name_company          | Nom de la compagnie                                                                                      | AN   | 50     |                            |
| iata_code_company     | Identifiant de la compagnie aérienne                                                                     | AN   | 10     |                            |
| nom_airport           | Nom de l'aéroport                                                                                        | A    | 50     |                            |
| code_iata_airport     | Identifiant de localisation                                                                              | AN   | 10     |                            |
| name_city             | Nom d'une ville                                                                                          | A    | 50     |                            |
| name_country          | Nom d'un pays                                                                                            | A    | 50     |                            |

# Modèle Conceptuel des Données
Cliquer sur le MCD pour l'atteindre : [![MCD.png](./databaseDesign/MCD.png)](./databaseDesign/MCD.png)

# Modèle Logique des Données
Cliquer sur le MLD pour l'atteindre : [![MLD.png](./databaseDesign/MLD.jpg)](./databaseDesign/MLD.jpg)

# Modèle Physique des Données
 ~~~sql
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
   state LOGICAL,
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
~~~

# UML (Unified Modeling Language)

## Diagramme use case
Cliquer sur le diagramme pour l'atteindre : [![diagrammeUseCase.png](./UML/diagrammeUseCase.png)](./UML/diagrammeUseCase.png)

## Diagramme use case
Cliquer sur le diagramme pour l'atteindre : [![diagrammeDeClasse.drawio.png](./UML/diagrammeDeClasse.drawio.png)](./UML/diagrammeDeClasse.drawio.png)