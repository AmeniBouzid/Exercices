# Ce script PowerShell exporte les 10 processus utilisant le plus 
# de mémoire  vers un fichier CSV sur le bureau de l'utilisateur.
# Afficher un message de confirmation apres l'exportation
# Etudiants: Ameni Bouzid et Eddy Manoa Randrianarison

# 1.Récuperer les processus avec la commande Get-Process

# 2.Trier les processus par l'utilisation de la mémoire (WS allis de WorkingSet) en ordre decroissant
# en utilisant Sort-Object avec la proptiété WS et l'option -Descending

# 3.Sélectionner les 10 premiers processus avec select-Object -first 10

# 4.Exporter les résultats dans un fichier CSV avec Export-Csv et spécifier le chemin du bureau de l'utilisateur

# Afficher un message de confirmation après l'exportation avec Write-Host et définir la couleur du texte avec -ForegroundColor 

Get-Process | Sort-Object -Property WS -Descending | select-Object -first 10 | Export-Csv -Path "C:\Users\2461695\Desktop\Rapport_Memoire.csv" 
Write-Host "Le rapport a été exporté avec succès vers le bureau." -ForegroundColor Green