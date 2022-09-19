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
Cliquer sur le MCD pour l'atteindre : [![MCD.png](./database%20design/MCD.png)](./database%20design/MCD.png)
