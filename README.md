# Storingsmelder
Een klein meldingensysteem voor storingen. Je meldt een storing via een
formulier, je ziet de openstaande meldingen in een lijst, en je sluit ze af als
ze opgelost zijn. 

## Installatie
```
git clone https://github.com/hendrik-5493246/cloud-computing.git
cd cloud-computing
cp .env.example .env
```
Ga in ‘.env’ en vul de omgevingsvariabelen voor PostgreSQL in.

Bouw de applicatie met Docker Compose:
```
docker compose up -d --build
```
Ga in je browser naar “localhost:8000” om het formulier te gebruiken.
Louter ter demonstratie draait er nog een tweede webapplicatie op poort 8001, die dezelfde database gebruikt. Probeer het maar: meldingen die je in het ene formulier ingeeft, verschijnen ook in het andere formulier (na verversen van je browservenster).

## Controle
Ga naar localhost:8000**/health** →
Als alles werkt, krijg je dit te zien:  
`{"opslag":"PostgreSQL","status":"ok"}`

## Opruimen
Tot zover deze demo. Wis alles, inclusief de database, met:  
```
docker compose down --rmi all -v
```


