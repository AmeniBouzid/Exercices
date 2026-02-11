
#Exercice DateTime
do{
    #demander une date à l.utilisateur
[datetime]$date = Read-Host "Entrez une date"

#convertir la date en objet datetime
$read -as [datetime]
} until ($date)
#obtenir la date d'aujourd'hui
$today = Get-Date

#calculer la différence entre la date d'aujourd'hui et la date entrée par l'utilisateur
$diff = $today - $date

Write-Output $diff.Days





