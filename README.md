# Storingsmelder
Een klein meldingensysteem voor storingen. Je meldt een storing via een formulier, je ziet de openstaande meldingen in een lijst, en je sluit ze af als ze opgelost zijn. 

## Uitrol op een Kubernetes-cluster
```
git clone https://github.com/hendrik-5493246/cloud-computing.git
cd cloud-computing
```
Na het clonen van de GitHub-repo moet je ervoor zorgen dat Docker Desktop Kubernetes actief is en dat je kubectl-context op `docker-desktop` staat. Controleer of de cluster draait met `kubectl get nodes`. Er moet minstens één node de status *Ready* hebben.

Ga daarna naar de map van het project. In k8s/ staan vier manifests:
- deployment.yaml → Deployment van de Storingsmelder-webapp
- service.yaml → Service van de webapp
- db-deployment.yaml → PostgreSQL Deployment
- db-service.yaml → PostgreSQL Service

Maak vervolgens alle Kubernetes-objecten aan met één commando:

```
kubectl apply -f k8s/
```
Dat start:
- 2 replica's van de Storingsmelder-applicatie;
- 1 replica van de PostgreSQL-database;
- een Service voor de applicatie;
- een Service voor de database.

## Controle
```
kubectl get pods
kubectl get services
```
De database-Service moet bereikbaar zijn via haar servicenaam, want de `DATABASE_URL` in de applicatie verwijst naar die naam en niet naar localhost of een IP-adres.

Wacht tot de rollout voltooid is:
```
kubectl rollout status deployment/storingsmelder
```
Om de webapp vanaf je browser te bereiken, maak je tijdelijk een port-forward naar de Service:
```
kubectl port-forward service/storingsmelder 8000:80
```
Extra controle: ga naar localhost:8000<strong>/health</strong> →
Als alles werkt, krijg je dit te zien:  
`{"opslag":"PostgreSQL","status":"ok"}`

## Opruimen
Tot zover deze demo. Wis alles, inclusief de database, met:  
```
kubectl delete -f k8s/
```


