### Authentification
Fonctionnalité à venir. 

### Matrices d'habilitation au form builder

| Habilitation             | update | fork | export | mapping Orbis/DL | mapping Orbis | module termino |
|--------------------------|:------:|:----:|:------:|:----------------:|:-------------:|:--------------:|
| ReadOnly                 |        |      | x      | lecture seule    | lecture seule |                |
| FormCreator              | x      | x    | x      | lecture seule    | lecture seule |                |
| OrbisFormCreator         | x      | x    | x      | x                | x             |                |
| Admin                    | x      | x    | x      | x                | x             | x              |

### Matrice d'autorisation HAPI / BackEnd

| Habilitation             | type de ressource | lecture | modification | ecriture | validation | expand |
|--------------------------|-------------------|:-------:|:------------:|:--------:|:----------:|:------:|
| ReadOnly                 | Questionnaire     | x       |              |          | x          | NA     |
| FormCreator              | Questionnaire     | x       | x            | x        | x          | NA     |
| OrbisFormCreator         | Questionnaire     | x       | x            | x        | x          | NA     |
| Admin                    | Questionnaire     | x       | x            | x        | x          | NA     |
| ReadOnly                 | ValueSet          | x       |              |          |            | x      |
| FormCreator              | ValueSet          | x       |              |          |            | x      |
| OrbisFormCreator         | ValueSet          | x       |              |          |            | x      |
| Admin                    | ValueSet          | x       | x            | x        | x          | x      |
| ReadOnly                 | CodeSystem        | x       |              |          |            | NA     |
| FormCreator              | CodeSystem        | x       |              |          |            | NA     |
| OrbisFormCreator         | CodeSystem        | x       |              |          |            | NA     |
| Admin                    | CodeSystem        | x       | x            | x        | x          | NA     |

Une autorisation en lecture permet de faire tout type de recherche. 