Le processus général de développement et de release de nouvelles versions du formbuilder suit la logique suivante : 

<div style="text-align: center;">{%include macro-process-release.svg%}</div>

Toutes les 4 semaines, lors d'un point réunissant l'équipe, on :
 - cloture le sprint précédent :
   - discussion des différences entre l'attendu et le réalisé
   - validation du déploiement à réaliser
   - mise à jour du milestone tel que finalement atteint
   - enrichissement du changelog
 - ouvre un nouveau sprint : 
   - discussion des issues présélectionnées par le PO (chacun peut ajouter des issues à l'OdJ) 
   - validation et rédaction de la milestone pour le sprint débutant

Pendant 4 semaines, l'équipe traite les issues sélectionnées. 

L'état des issues évolue comme suit (pour alléger le diagramme, les flèches de sortie de l'état "Blocked" ne sont pas mentionnées): 

<div style="text-align: center;">{%include issue-state-diagram.svg%}</div>

On remarque que : 
 - dans l'état in-progress, les modifications apportées au projet dans le cadre de l'issue ne sont déployées que dans l'environnement de développement
 - dans l'état to-qualify, elles sont déployées dans l'environnement de qualification. 
 - dans l'état closed, elles sont déployées dans la sandbox et dans l'environnement de production

Si la résolution d'une issue ne passe pas la qualification, elle retourne à l'état to-do et les déploiements en qualification sont rollback. 
Ce fonctionnement est facilité par l'existence d'une branche par issue. 


En cas d'issue bloquante/critique apparue suite à une release, il est possible de deployer un hotfix. Le processus général évolue : 

<div style="text-align: center;">{%include bug-process-release.svg%}</div>

mais le diagramme d'état est le même.

{% include markdown-link-references.md %}